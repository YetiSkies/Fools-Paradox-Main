SMODS.Joker {
    key = 'shocked_fool',
    config = { extra = { levels = 1 } },
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 2, y = 13 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.levels } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition then
            local hand = G.GAME.last_hand_played
            if hand and G.GAME.hands[hand] then
                local target = context.blueprint_card or card
                card_eval_status_text(target, 'extra', nil, nil, nil, {
                    message = localize('k_level_up_ex'),
                    colour = G.C.FILTER
                })
                level_up_hand(target, hand, nil, card.ability.extra.levels)
            end
        end
    end
}