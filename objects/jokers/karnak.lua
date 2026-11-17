SMODS.Joker {
    key = 'karnak',
    config = { extra = { x_mult = 1.5 } },
    rarity = 4,
    cost = 20,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 8, y = 13 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult } }
    end,

    calculate = function(self, card, context)
        if context.other_joker and context.other_joker ~= card and context.other_joker.config and context.other_joker.config.center and context.other_joker.config.center.rarity == 'foolspara_parallel' then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end
}