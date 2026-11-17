SMODS.Joker {
    key = 'beanie_baby',
    config = { extra = { x_chips = 1.5 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 5, y = 10 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_chips } }
    end,

    calculate = function(self, card, context)
        if context.other_joker and context.other_joker ~= card and not context.other_joker.debuff and context.other_joker.config and context.other_joker.config.center then
            local r = context.other_joker.config.center.rarity
            if r == 1 or (type(r) == 'string' and string.lower(r) == 'common') then
                return {
                    x_chips = card.ability.extra.x_chips
                }
            end
        end
    end
}