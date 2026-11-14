SMODS.Joker {
    key = 'poindexter',
    config = { extra = { chips_sub = -10, mult = 20 } },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 2, y = 5 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 14 then
                return {
                    chips = card.ability.extra.chips_sub,
                    mult = card.ability.extra.mult,
                    card = card
                }
            end
        end
    end
}