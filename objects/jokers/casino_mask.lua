local function get_casino_suit(exclude_suit)
    local pool = {}
    local seen = {}
    if G.playing_cards then
        for _, c in ipairs(G.playing_cards) do
            if not SMODS.has_no_suit(c) and not SMODS.has_any_suit(c) and c.base and c.base.suit and not seen[c.base.suit] then
                seen[c.base.suit] = true
                pool[#pool + 1] = c.base.suit
            end
        end
    end
    if #pool == 0 then
        for k, v in pairs(SMODS.Suits) do
            if not v.in_pool or v:in_pool() then
                pool[#pool + 1] = k
            end
        end
    end
    if #pool > 1 and exclude_suit then
        local filtered = {}
        for _, s in ipairs(pool) do
            if s ~= exclude_suit then
                filtered[#filtered + 1] = s
            end
        end
        if #filtered > 0 then
            pool = filtered
        end
    end
    local chosen, _ = pseudorandom_element(pool, pseudoseed('casino_mask'))
    return chosen or 'Spades'
end

SMODS.Joker {
    key = 'casino_mask',
    config = { extra = { x_mult = 2, suit = 'Spades' } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 1, y = 12 },

    loc_vars = function(self, info_queue, card)
        local suit = card.ability.extra.suit or 'Spades'
        return {
            vars = {
                card.ability.extra.x_mult,
                localize(suit, 'suits_singular'),
                colours = { G.C.SUITS[suit] or G.C.FILTER }
            }
        }
    end,

    set_ability = function(self, card, initial, delay_sprites)
        if initial then
            card.ability.extra.suit = get_casino_suit()
        end
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local target_suit = card.ability.extra.suit or 'Spades'
            if context.other_card:get_id() == 14 and context.other_card:is_suit(target_suit) then
                return {
                    x_mult = card.ability.extra.x_mult
                }
            end
        end

        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            card.ability.extra.suit = get_casino_suit(card.ability.extra.suit)
        end
    end
}