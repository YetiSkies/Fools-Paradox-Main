SMODS.Joker {
    key = 'tigers_eye',
    config = { extra = { x_chips = 1.5 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 0, y = 3 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_chips } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit('foolspara_Bells') then
                return {
                    x_chips = card.ability.extra.x_chips,
                    card = card
                }
            end
        end
    end
}