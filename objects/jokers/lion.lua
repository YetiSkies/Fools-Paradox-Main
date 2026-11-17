SMODS.Joker {
    key = 'lion',
    config = { extra = { mult = 1, dollars = 2 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 6, y = 10 },

    loc_vars = function(self, info_queue, card)
        local current_mult = card.ability.extra.mult * math.max(0, math.floor(((G.GAME and G.GAME.dollars or 0) + (G.GAME and G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars))
        return { vars = { card.ability.extra.mult, card.ability.extra.dollars, current_mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local total_mult = card.ability.extra.mult * math.max(0, math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars))
            if total_mult > 0 then
                return {
                    mult = total_mult
                }
            end
        end
    end
}