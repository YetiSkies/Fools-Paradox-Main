SMODS.Joker {
    key = 'labradorite',
    config = { extra = { x_chips = 1.5 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 3, y = 3 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_chips } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand then
            if context.other_card:is_suit('foolspara_Acorns') and not context.other_card.debuff then
                return {
                    x_chips = card.ability.extra.x_chips,
                    card = card
                }
            end
        end
    end
}