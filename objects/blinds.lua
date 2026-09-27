SMODS.Atlas({
    key = 'foolspara_blinds',
    path = 'blinds.png',
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    px = 34,
    py = 34
})
-- Deal - Small Blind
SMODS.Blind({
    key = 'deal',
    atlas = 'foolspara_blinds',
    pos = { y = 0 },
    boss_colour = HEX('8095F7'),
    mult = 1.3,
    dollars = 4,
    small = { min = 1 }
})
-- Bluff - Small Blind
SMODS.Blind({
    key = 'bluff',
    atlas = 'foolspara_blinds',
    pos = { y = 1 },
    boss_colour = HEX('481F01'),
    mult = 1.4,
    dollars = 3,
    small = { min = 1 }
})
-- Hold'em - Big Blind - slightly higher mult than usual
SMODS.Blind({
    key = 'hold_em',
    atlas = 'foolspara_blinds',
    pos = { y = 3 },
    boss_colour = HEX('79305a'),
    mult = 1.65,
    dollars = 4,
    big = { min = 1 }
})
-- Rummy - Big Blind - Higher Mult and Money than usual
SMODS.Blind({
    key = 'rummy',
    atlas = 'foolspara_blinds',
    pos = { y = 2 },
    boss_colour = HEX('620072'),
    mult = 1.8,
    dollars = 5,
    big = { min = 1 }
})
-- Rummy - Big Blind - Mini-boss Blind
SMODS.Blind({
    key = 'blackjack',
    atlas = 'foolspara_blinds',
    pos = { y = 4 },
    boss_colour = HEX('310139'),
    mult = 2.1,
    dollars = 6,
    big = { min = 1 }
})

local blind_get_type = Blind.get_type
function Blind:get_type()
    if self.small then
        return 'Small'
    elseif self.big then
        return 'Big'
    else
        return blind_get_type(self)
    end
end

--The Line - When discarding add 2 stone cards to Deck- Tested and Working
SMODS.Blind {
    key = "line",
    atlas = "foolspara_blinds",
    dollars = 5,
    mult = 2,
    pos = { y = 5 },
    boss = { min = 1 },
    boss_colour = HEX("575757"),
    debuff = {

    },
    loc_vars = function(self)

    end,
    collection_loc_vars = function(self)

    end,
    calculate = function(self, blind, context)
        if context.pre_discard then
            G.E_MANAGER:add_event(Event({
                func = function()
                    for i = 1, 2 do
                        local _pool = { G.P_CARDS.H_2, G.P_CARDS.C_2, G.P_CARDS.D_2, G.P_CARDS.S_2 }
                        local _card = create_playing_card({
                            front = pseudorandom_element(_pool, pseudoseed('thelinevariable')),
                            center = G.P_CENTERS.m_stone
                        }, G.deck, nil, nil, { G.C.SECONDARY_SET.Enhanced })
                    end
                    return true
                end
            }))
        end
    end
}

-- The Caribou - Playing Most played hand sets Mult to 0- Tested and working
SMODS.Blind {
    key = 'caribou',
    atlas = 'foolspara_blinds',
    pos = { y = 6 },
    boss = { min = 1 },
    boss_colour = HEX('310139'),
    mult = 2.1,
    dollars = 6,
    loc_vars = function(self)
        return { vars = { localize(G.GAME.current_round.most_played_poker_hand, 'poker_hands') } }
    end,
    collection_loc_vars = function(self)
        return { vars = { localize('ph_most_played') } }
    end,
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.modify_hand then
                if context.scoring_name == G.GAME.current_round.most_played_poker_hand then
                    blind.triggered = true
                    mult = 0
                    update_hand_text({ sound = 'debuff1', modded = true }, { mult = mult })
                end
            end
        end
    end
}

--The Tent -All Cards Drawn Face Down Except after Discard- tested and working
SMODS.Blind {
    key = 'tent',
    atlas = 'foolspara_blinds',
    pos = { y = 7 },
    boss_colour = HEX('310139'),
    mult = 2.1,
    dollars = 6,
    boss = { min = 1 },
    stay_flipped = function(self, area, card)
        if (area == G.hand) and G.GAME.blind.prepped then
            return true
        end
    end,
    press_play = function(self)
        if not G.GAME.blind.disabled then
            G.GAME.blind.prepped = true
        end
    end,
    set_blind = function(self, reset, silent)
        if not reset then
            G.GAME.blind.prepped = true
        end
    end,
}
-- The Facade - Small Blind, No Payout - Tested and working - In future might have this blind appear as The Wall until Selected
SMODS.Blind({
    key = 'facade',
    atlas = 'foolspara_blinds',
    pos = { y = 8 },
    boss = { min = 1 },
    boss_colour = HEX('620072'),
    mult = 1.5,
    dollars = 0,
})

-- The Anchor -1 in ? cards are destroyed when Drawn - Tested and Working
SMODS.Blind({
    key = 'anchor',
    atlas = 'foolspara_blinds',
    pos = { y = 9 },
    boss = { min = 4 },
    boss_colour = HEX('620072'),
    mult = 2,
    dollars = 6,
    drawn_to_hand = function()
        if G.GAME.blind.disabled then
            return
        end

        local card = pseudorandom_element(G.hand.cards, pseudoseed("bl_foolspara_anchor"))
        G.E_MANAGER:add_event(Event {
            trigger = "after",
            delay = 0.5,
            func = function()
                if card.ability.name == G.P_CENTERS.m_glass.name then
                    card:shatter()
                else
                    card:start_dissolve()
                end
                G.GAME.blind:wiggle()
                draw_card(G.deck, G.hand, nil, "up", true)
                return true
            end,
        })
        return true
    end,
})

-- The Foot - TEMP EFFECT
SMODS.Blind({
    key = 'foot',
    atlas = 'foolspara_blinds',
    pos = { y = 10 },
    boss = { min = 1 },
    boss_colour = HEX('620072'),
    mult = 2.8,
    dollars = 7,
    calculate = function(self, card, context)
        if not G.GAME.blind.disabled and context.before and not context.blueprint then
            for k, v in ipairs(context.scoring_hand) do
                if next(SMODS.get_enhancements(v)) and not v.debuff and not v.vampired then
                    v.vampired = true
                    v:set_ability('c_base', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                            v:juice_up()
                            v.vampired = nil
                            return true
                        end
                    }))
                end
            end
        end
    end
})


-- The Scepter - Clubs and Hearts are Debuffed - Confirmed Working
SMODS.Blind({
    key = 'scepter',
    atlas = 'foolspara_blinds',
    pos = { y = 11 },
    boss = { min = 3 },
    boss_colour = HEX('46346d'),
    mult = 2.2,
    dollars = 7,
    calculate = function(self, blind, context)
        if context.debuff_card and (context.debuff_card:is_suit("Clubs", true) or context.debuff_card:is_suit("Hearts", true)) then return { debuff = true } end
    end
})

-- The Bowl - After hand is played, discard hand after draw -- Works
SMODS.Blind({
    key = 'bowl',
    atlas = 'foolspara_blinds',
    pos = { y = 12 },
    boss = { min = 1 },
    boss_colour = HEX('620072'),
    mult = 1.5,
    dollars = 0,
    drawn_to_hand = function(self)
        if G.GAME.blind.should_discard then
            for _, v in ipairs(G.hand.cards) do
                G.hand.highlighted[#G.hand.highlighted + 1] = v
                v:highlight(true)
            end
            G.FUNCS.discard_cards_from_highlighted(nil, true)
            G.GAME.blind.should_discard = false
        end
    end,

    press_play = function(self)
        G.GAME.blind.should_discard = true
    end,

    in_pool = function(self)
        return G.GAME.round_resets.ante > G.GAME.win_ante
    end,
})

-- Skeptic - 5 Card Hands are not allowed - Tested and Working
SMODS.Blind({
    key = 'skeptic',
    atlas = 'foolspara_blinds',
    pos = { y = 13 },
    boss = { min = 1 },
    boss_colour = HEX('620072'),
    mult = 2,
    dollars = 5,
    debuff = { h_size_le = 4 }
})

-- The Spur - Clubs and Spades are debuffed - Tested and Working
SMODS.Blind({
    key = 'spur',
    atlas = 'foolspara_blinds',
    pos = { y = 14 },
    boss = { min = 1 },
    boss_colour = HEX('8f6d7b'),
    mult = 2.2,
    dollars = 7,
    calculate = function(self, blind, context)
        if context.debuff_card and (context.debuff_card:is_suit("Clubs", true) or context.debuff_card:is_suit("Spades", true)) then return { debuff = true } end
    end
})

--The Lava - Discard 3 cards from top of deck when you Play or Discard - Tested and Working
SMODS.Blind({
    key = 'lava',
    atlas = 'foolspara_blinds',
    pos = { y = 15 },
    boss = { min = 1 },
    boss_colour = HEX('620072'),
    mult = 1.5,
    dollars = 0,
    debuff = {
        to_discard = 3
    },
    loc_vars = function(self)
        return {
            vars = {
                self.debuff.to_discard
            }
        }
    end,
    collection_loc_vars = function(self)
        return {
            vars = {
                self.debuff.to_discard
            }
        }
    end,
    press_play = function(self)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                for i = 1, self.debuff.to_discard do
                    draw_card(G.deck, G.discard, 1 * 100 / 3, 'down', false, v)
                end
                return true
            end
        }))
    end,
    calculate = function(self, blind, context)
        if context.pre_discard then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    for i = 1, self.debuff.to_discard do
                        draw_card(G.deck, G.discard, 1 * 100 / 3, 'down', false, v)
                    end
                    return true
                end
            }))
        end
    end
})

-- The Tile - Diamonds and Spades are Debuffed - Tested and Working
SMODS.Blind({
    key = 'tile',
    atlas = 'foolspara_blinds',
    pos = { y = 16 },
    attributes = { 'suit', 'spades', 'diamonds' },
    boss = { min = 3 },
    boss_colour = HEX('565d6a'),
    mult = 2.2,
    dollars = 7,
    calculate = function(self, blind, context)
        if context.debuff_card and (context.debuff_card:is_suit("Diamonds", true) or context.debuff_card:is_suit("Spades", true)) then return { debuff = true } end
    end
})

-- The Strife - Large Blind, Low Payout - Tested and Working
SMODS.Blind({
    key = 'strife',
    atlas = 'foolspara_blinds',
    pos = { y = 17 },
    boss = { min = 3 },
    boss_colour = HEX('620072'),
    mult = 3,
    dollars = 3,
})

-- The Suspect - Cards with Seals are Debuffed - working
SMODS.Blind({
    key = 'suspect',
    atlas = 'foolspara_blinds',
    pos = { y = 18 },
    boss = { min = 1 },
    boss_colour = HEX('620072'),
    mult = 2.2,
    dollars = 5,
    recalc_debuff = function(self, card, from_blind)
        if card.area ~= G.jokers and not G.GAME.blind.disabled then
            if card.seal then
                return true
            end
            return false
        end
    end,
})

-- The Pick -- Hand Must Contain a non-scoring Card - works
SMODS.Blind({
    key = 'pick',
    atlas = 'foolspara_blinds',
    pos = { y = 19 },
    boss = { min = 1 },
    boss_colour = HEX('620072'),
    mult = 1.5,
    dollars = 0,
    debuff_hand = function(self, cards, hand, handname, check)
        if #cards < 1 then return true end
        local _, _, _, scoring_hand, _ = G.FUNCS.get_poker_hand_info(cards)

        for i, card in ipairs(cards) do
            if not SMODS.in_scoring(card, scoring_hand) and not SMODS.always_scores(card) then return end
        end

        return true
    end 
})

-- The Peak - Ranks 2-6 are Debuffed - Tested and Working
SMODS.Blind({
    key = 'peak',
    atlas = 'foolspara_blinds',
    pos = { y = 20 },
    attributes = { 'debuff', 'rank', 'two', 'three', 'four', 'five', 'six' },
    boss = { min = 3 },
    boss_colour = HEX('8f6d7b'),
    mult = 2.2,
    dollars = 7,
    calculate = function(self, blind, context)
        if context.debuff_card and (context.debuff_card:get_id() == 2 or context.debuff_card:get_id() == 3 or context.debuff_card:get_id() == 4 or context.debuff_card:get_id() == 5 or context.debuff_card:get_id() == 6) then return { debuff = true } end
    end

})

-- The Changeling - Scored cards can randomly change rank and suit - Tested and Working
SMODS.Blind({
    key = 'changeling',
    atlas = 'foolspara_blinds',
    pos = { y = 21 },
    boss = { min = 1 },
    boss_colour = HEX('620072'),
    mult = 1.5,
    dollars = 0,
    debuff = {
        chance = 3
    },
    loc_vars = function(self)
        local new_numerator, new_denominator = SMODS.get_probability_vars(self, 1, self.debuff.chance,
            "foolspara_card_debuff")

        return {
            vars = {
                new_numerator,
                new_denominator
            }
        }
    end,
    collection_loc_vars = function(self)
        return {
            vars = {
                G.GAME.probabilities.normal,
                self.debuff.chance
            }
        }
    end,

    calculate = function(self, blind, context)
        if context.individual and context.cardarea == G.play then
            -- if pseudorandom("foolspara_blind_changeling") < G.GAME.probabilities.normal / blind.debuff.chance then
            if SMODS.pseudorandom_probability(self, 'foolspara_blind_changeling', 1, self.debuff.chance, "foolspara_card_randomize") then
                local _pcard = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local _suit = pseudorandom_element(SMODS.Suits, pseudoseed("foolspara_random_code"))
                        local _rank = pseudorandom_element(SMODS.Ranks, pseudoseed("foolspara_random_code"))
                        blind:wiggle()
                        _pcard:flip()
                        SMODS.change_base(_pcard, _suit.key, _rank.key)
                        _pcard:flip()
                        blind:wiggle()

                        return true
                    end
                }))
            end
        end
    end
})

--The Mast -- Raise Ante by 2 instead of 1 -- works
SMODS.Blind({
    key = 'mast',
    atlas = 'foolspara_blinds',
    pos = { y = 22 },
    boss = { min = 1 },
    boss_colour = HEX('620072'),
    mult = 1.5,
    dollars = 0,
    set_blind = function(self, reset, silent)
        if not reset then
            ease_ante(1)
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + 1
            G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante + 1) * G.GAME.blind.mult *
                G.GAME.starting_params.ante_scaling
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            G.GAME.blind:set_text()
        end
    end,
    disable = function(self)
        ease_ante(-1)
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - 1
        G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante - 1) * G.GAME.blind.mult *
            G.GAME.starting_params.ante_scaling
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        G.GAME.blind:set_text()
    end
})

-- The Thread - Play only High Card this round - Tested and Working
SMODS.Blind({
    key = 'thread',
    atlas = 'foolspara_blinds',
    pos = { y = 23 },
    boss = { min = 1 },
    boss_colour = HEX('620072'),
    mult = 2,
    dollars = 5,
    debuff_hand = function(self, cards, hand, handname, check)
        if handname == ("High Card") then
            return false
        end
        G.GAME.blind.triggered = true
        return true
    end,
})

-- The Dome - Hearts and Diamonds are Debuffed - Tested and working
SMODS.Blind({
    key = 'dome',
    atlas = 'foolspara_blinds',
    pos = { y = 24 },
    boss = { min = 1 },
    boss_colour = HEX('620072'),
    mult = 2.2,
    dollars = 7,
    calculate = function(self, blind, context)
        if context.debuff_card and (context.debuff_card:is_suit("Diamonds", true) or context.debuff_card:is_suit("Hearts", true)) then return { debuff = true } end
    end
})

-- The Calm - Lose $1 for each card held in hand - Works
SMODS.Blind({
    key = 'calm',
    atlas = 'foolspara_blinds',
    pos = { y = 25 },
    boss = { min = 1 },
    boss_colour = HEX('620072'),
    mult = 1.5,
    dollars = 0,
    press_play = function(self)
        if G.GAME.blind.disabled then
            return
        end

        G.E_MANAGER:add_event(Event {
            trigger = "after",
            delay = 0.2,
            func = function()
                for _, card in ipairs(G.hand.cards) do
                    G.E_MANAGER:add_event(Event {
                        func = function()
                            card:juice_up()
                            return true
                        end,
                    })
                    ease_dollars(-1)
                    delay(0.23)
                end
                return true
            end,
        })
        return true
    end,
})

--The Storm -    0 base Chips and 1 base Mult - works
SMODS.Blind({
    key = 'storm',
    atlas = 'foolspara_blinds',
    pos = { y = 26 },
    boss = { min = 1 },
    boss_colour = HEX('620072'),
    mult = 1.5,
    dollars = 0,
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        if (mult ~= 1) or (hand_chips ~= 0) then
            return 1, 0, true
        end
        return 1, 0, false  
    end
})

--The Liar - Hand Must contain a Face Card -works   
SMODS.Blind({
    key = 'liar',
    atlas = 'foolspara_blinds',
    pos = { y = 27 },
    boss = { min = 1 },
    boss_colour = HEX('620072'),
    mult = 2,
    dollars = 5,
    debuff_hand = function(self, cards, hand, handname, check)
        for i = 1, #cards do
            if cards[i]:is_face() then
                return false
            end
        end
        return true
    end,
    in_pool = function(self)
        for _, playing_card in ipairs(G.playing_cards or {}) do     
            if playing_card:is_face() then
                return true
            end
        end
        return false
    end
})

--Clever Club - 2-9 Are Debuffed - Tested and Working
SMODS.Blind({
    key = 'finalclub',
    atlas = 'foolspara_blinds',
    pos = { y = 28 },
    boss = { showdown = true },
    boss_colour = HEX('620072'),
    mult = 3,
    dollars = 10,
    calculate = function(self, blind, context)
        if context.debuff_card and (context.debuff_card:get_id() == 2 or context.debuff_card:get_id() == 3 or context.debuff_card:get_id() == 4 or context.debuff_card:get_id() == 5 or context.debuff_card:get_id() == 6 or context.debuff_card:get_id() == 7 or context.debuff_card:get_id() == 8 or context.debuff_card:get_id() == 9) then return { debuff = true } end
    end
})

--Wicked Wand - Played Hand must contain a 3 of a kind - Tested and Working
SMODS.Blind({
    key = 'finalwand',
    atlas = 'foolspara_blinds',
    pos = { y = 29 },
    boss = { showdown = true },
    boss_colour = HEX('620072'),
    mult = 3,
    dollars = 10,
    debuff_hand = function(self, cards, hand, handname, check)
        if next(hand["Three of a Kind"]) then
            return false
        end
        G.GAME.blind.triggered = true
        return true
    end,
})

--Shining Star - Large Blind, Large Payout - Tested and Working
SMODS.Blind({
    key = 'finalstar',
    atlas = 'foolspara_blinds',
    pos = { y = 30 },
    boss = { showdown = true },
    boss_colour = HEX('620072'),
    mult = 8,
    dollars = 16,
})

--Sapphire Spade - Large Blind, 1 in 2 scored cards are destroyed -- working
SMODS.Blind({
    key = 'finalspade',
    atlas = 'foolspara_blinds',
    pos = { y = 31 },
    boss = { showdown = true },
    boss_colour = HEX('620072'),
    mult = 3.2,
    dollars = 10,
    calculate = function(self, blind, context)
        if
            context.destroy_card
            and (context.cardarea == G.play or context.cardarea == "unscored")
            and not G.GAME.blind.disabled
            and pseudorandom("sapphirespade") < 0.5
        then
            return { remove = true }
        end
    end,
})

-- Brilliant Diamond - Jokers Rare and Aboved are Debuffed -- working
SMODS.Blind({
    key = 'finaldiamond',
    atlas = 'foolspara_blinds',
    pos = { y = 32 },
    boss = { showdown = true },
    boss_colour = HEX('620072'),
    mult = 3,
    dollars = 10,
    recalc_debuff = function(self, card, from_blind)
        if (card.area == G.jokers) and not G.GAME.blind.disabled and not ((card.config.center.rarity == 1) or (card.config.center.rarity == 2)) then
            return true
        end
        return false
    end,
    in_pool = function(self)
        if not G.jokers then return false end
        for i, j in pairs(G.jokers.cards) do
            if not ((j.config.center.rarity == 1) or (j.config.center.rarity == 2)) then
                return true
            end
        end
        return false
    end
})
