SMODS.Joker {
    key = 'duchess',
    config = { extra = { x_chips = 1.5 } },
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 0, y = 9 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_chips } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card:get_id() == 12 then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED
                    }
                else
                    return {
                        x_chips = card.ability.extra.x_chips
                    }
                end
            end
        end
    end
}