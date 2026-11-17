SMODS.Joker {
    key = 'self_made_fool',
    config = { extra = { x_mult = 0.5, dollars = 25 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 3, y = 13 },

    loc_vars = function(self, info_queue, card)
        local dollars = (G.GAME and G.GAME.dollars or 0) + (G.GAME and G.GAME.dollar_buffer or 0)
        local current_x = 1 + (card.ability.extra.x_mult * math.max(0, math.floor(dollars / card.ability.extra.dollars)))
        return { vars = { card.ability.extra.x_mult, card.ability.extra.dollars, current_x } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local dollars = (G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)
            local total_x = 1 + (card.ability.extra.x_mult * math.max(0, math.floor(dollars / card.ability.extra.dollars)))
            if total_x > 1 then
                return {
                    x_mult = total_x
                }
            end
        end
    end
}