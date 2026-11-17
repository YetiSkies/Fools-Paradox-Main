SMODS.Joker {
    key = 'straight_ticket',
    config = { extra = { repetitions = 1 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 9, y = 11 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.repetitions } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            local played_count = context.full_hand and #context.full_hand or (G.play and G.play.cards and #G.play.cards or 0)
            if played_count == 5 then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.repetitions,
                    card = context.blueprint_card or card
                }
            end
        end
    end
}