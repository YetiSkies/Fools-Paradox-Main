-- Literally just an implementation of table.find since this version of lua doesn't have one by default
function FOOLSPARA.find(table, value)
  for i, v in ipairs(table) do
    if v == value then
      return i
    end
  end
  return nil
end


---Gets the number of complete suits that the user has in their deck
---@param vanilla_ranks boolean
---@return integer
function FOOLSPARA.get_complete_suits(vanilla_ranks)
  if not G.playing_cards then return 0 end

  local deck = {}
  local amount = 0

  for k, v in ipairs(G.playing_cards) do
    if not SMODS.has_no_suit(v) then
      deck[v.base.suit] = deck[v.base.suit] or {}
      deck[v.base.suit][v.base.value] = true
    end
  end

  for _, deck_ranks in pairs(deck) do
    local res = true

    for k, v in pairs(vanilla_ranks and FOOLSPARA.base_ranks or SMODS.Ranks) do
      if not deck_ranks[vanilla_ranks and v or k] then
        res = false
      end
    end

    amount = amount + (res and 1 or 0)
  end

  return amount
end

---Gets the number of unique suits in a provided scoring hand
---@param scoring_hand table
---@param bypass_debuff boolean?
---@param flush_calc boolean? Usually use this instead of bypass_debuff for Jokers:
--- debuffed wild cards are considered their original suit only
---@return integer
function FOOLSPARA.get_unique_suits(scoring_hand, bypass_debuff, flush_calc)
  -- Set each suit's count to 0
  local suits = {}

  for k, _ in pairs(SMODS.Suits) do
    suits[k] = 0
  end

  -- NOTE greedy algorithm is technically wrong for cards with weird suit combos,
  -- for example a card with suit A+B might count for A, blocking another card
  -- that can only be A
  -- (a bipartite matching algorithm would work)

  -- First we cover all the non Wild Cards in the hand
  for _, card in ipairs(scoring_hand) do
    if not SMODS.has_any_suit(card) then
      for suit, count in pairs(suits) do
        if card:is_suit(suit, bypass_debuff, flush_calc) and count == 0 then
          suits[suit] = count + 1
          break
        end
      end
    end
  end

  -- Then we cover Wild Cards, filling the missing suits
  for _, card in ipairs(scoring_hand) do
    if SMODS.has_any_suit(card) then
      for suit, count in pairs(suits) do
        if card:is_suit(suit, bypass_debuff, flush_calc) and count == 0 then
          suits[suit] = count + 1
          break
        end
      end
    end
  end

  -- Count the amount of suits that were found
  local num_suits = 0

  for _, v in pairs(suits) do
    if v > 0 then num_suits = num_suits + 1 end
  end

  return num_suits
end

--- Returns the key of the Planet card for the specified poker hand
--- @param hand_name string the name of the poker hand, like "Four of a Kind"
--- @return string?
function FOOLSPARA.get_planet_for_hand(hand_name)
  for _, v in ipairs(G.P_CENTER_POOLS.Planet) do
    if v.config and v.config.hand_type == hand_name then
      return v.key
    end
  end
end

--- Returns a list of visible hands, ordered by most played to least
--- @return {key: string, hand: table, planet_key: string}[]
function FOOLSPARA.get_most_played_hands()
  local hands = {}

  for _, v in ipairs(G.P_CENTER_POOLS.Planet) do
    if v.config and v.config.hand_type then
      local hand = G.GAME.hands[v.config.hand_type]

      if hand and hand.visible then
        hands[#hands + 1] = {
          key = v.config.hand_type,
          hand = hand,
          planet_key = v.key
        }
      end
    end
  end

  table.sort(hands, function(a, b)
    if a.hand.played ~= b.hand.played then
      return a.hand.played > b.hand.played
    end

    -- Sort by base values if the played amount is equal
    return (a.hand.s_mult * a.hand.s_chips) > (b.hand.s_mult * b.hand.s_chips)
  end)

  return hands
end

---Gets a sorted list of all ranks in descending order
---@return table
function FOOLSPARA.get_sorted_ranks()
  local ranks = {}

  for k, v in pairs(SMODS.Ranks) do
    ranks[#ranks + 1] = v
  end

  table.sort(ranks, function(a, b)
    return a.sort_nominal > b.sort_nominal
  end)

  return ranks
end

--- Checks whether a given card is a certain rank
---@param card Card | table
---@param rank string | integer a rank's name, like "Jack" or "4", or an id like 11 or 4
---@return boolean | nil
function FOOLSPARA.is_rank(card, rank)
  if not card or not card.get_id then return end
  local id = card:get_id()

  if type(rank) == 'string' then
    local rank_obj = SMODS.Ranks[rank]
    return rank_obj and rank_obj.id == id
  elseif type(rank) == 'number' then
    return id == rank
  end
end

---Gets a rank's object from a supplied id
---@param id integer
---@return table | nil
function FOOLSPARA.get_rank_from_id(id)
  for _, v in pairs(SMODS.Ranks) do
    if v.id == id then return v end
  end
end

---Returns whether the first rank is higher than the second
---@param rank1 string | integer a rank such as "Ace" or "9", or an id such as 14 or 9
---@param rank2 string | integer
---@param allow_equal? boolean
---@return boolean
function FOOLSPARA.compare_ranks(rank1, rank2, allow_equal)
  local r1 = type(rank1) == 'string' and SMODS.Ranks[rank1] or FOOLSPARA.get_rank_from_id(rank1)
  local r2 = type(rank2) == 'string' and SMODS.Ranks[rank2] or FOOLSPARA.get_rank_from_id(rank2)

  -- If one of the ranks doesn't exist
  if not r1 or not r2 then return false end

  local comp = function(a, b)
    return allow_equal and (a >= b) or (a > b)
  end

  return comp(r1.sort_nominal, r2.sort_nominal)
end

---Used to check whether a card is a light or dark suit
---@param card table
---@param type 'light' | 'dark'
---@param bypass_debuff boolean?
---@param flush_calc boolean? Usually use this instead of bypass_debuff for Jokers:
--- debuffed wild cards are considered their original suit only
---@return boolean
function FOOLSPARA.is_suit(card, type, bypass_debuff, flush_calc)
  assert(type == 'light' or type == 'dark')
  for _, v in ipairs(type == 'light' and FOOLSPARA.light_suits or FOOLSPARA.dark_suits) do
    if card:is_suit(v, bypass_debuff, flush_calc) then return true end
  end
  return false
end

--- FOOLSPARA.is_non_suit(card, X) checks if `card` specifically can only be a non-X suit.
--- Usually used to check for a negative effect happening, like
--- in Derecho: if the hand contains a non-dark -> no upgrade.
---
--- Works with edge cases:
--- - Stones return false (not a suit)
--- - Wilds return false (can always count as an X)
--- - Debuffed cards with a base suit of non-X return false,
---   if bypass_debuff and flush_calc are both false
---   (debuffed cards are non-scoring)
---
--- These edge cases are also why this should generally be used for negative effects only.
---
---@param card table
---@param type 'string' 'light', 'dark', or a suit key
---@param bypass_debuff boolean?
---@param flush_calc boolean? Usually use this instead of bypass_debuff for Jokers:
--- debuffed wild cards are considered their original suit only
---@return boolean
function FOOLSPARA.is_non_suit(card, type, bypass_debuff, flush_calc)
  local suit_arr = (
    type == 'light' and FOOLSPARA.light_suits
    or type == 'dark' and FOOLSPARA.dark_suits
    or { type }
  )
  for _, v in ipairs(suit_arr) do
    if card:is_suit(v, bypass_debuff, flush_calc) then return false end
  end
  if SMODS.has_no_suit(card) then return false end
  if card.debuff and not bypass_debuff and not flush_calc then return false end
  return true
end

---Checks if the provided suit is currently in the deck
---@param suit string
---@param ignore_wild? boolean
---@return boolean
function FOOLSPARA.has_suit_in_deck(suit, ignore_wild)
  for _, v in ipairs(G.playing_cards or {}) do
    if not SMODS.has_no_suit(v) and (v.base.suit == suit or (not ignore_wild and v:is_suit(suit))) then
      return true
    end
  end
  return false
end

-- Checks if a spectrum hand has been played
--- @return boolean
function FOOLSPARA.spectrum_played()
  local spectrum_played = false
  if G and G.GAME and G.GAME.hands then
    for k, v in pairs(G.GAME.hands) do
      if string.find(k, "Spectrum", nil, true) then
        if G.GAME.hands[k].played > 0 then
          spectrum_played = true
          break
        end
      end
    end
  end

  return spectrum_played
end

--- Whether the played hand contains a spectrum
---@param hands table obtained from `context.poker_hands`
---@return boolean | nil
function FOOLSPARA.contains_spectrum(hands)
  for k, v in pairs(hands) do
    if k:find('Spectrum', nil, true) and #v > 0 then
      return true
    end
  end
end

--- @return boolean
function FOOLSPARA.has_modded_suit_in_deck()
  for k, v in ipairs(G.playing_cards or {}) do
    local is_modded = true
    for _, suit in ipairs(FOOLSPARA.base_suits) do
      if v.base.suit == suit then
        is_modded = false
      end
    end

    if not SMODS.has_no_suit(v) and is_modded then
      return true
    end
  end
  return false
end
