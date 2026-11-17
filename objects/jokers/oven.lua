SMODS.Joker {
    key = 'oven',
    config = { extra = { x_chips = 1, gain = 0.5 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 3, y = 11 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.gain, card.ability.extra.x_chips } }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint and G.GAME and G.GAME.blind and G.GAME.blind.in_blind then
            card.ability.extra.x_chips = card.ability.extra.x_chips + card.ability.extra.gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
        end

        if context.joker_main and card.ability.extra.x_chips > 1 then
            return {
                x_chips = card.ability.extra.x_chips
            }
        end

        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            if card.ability.extra.x_chips > 1 then
                card.ability.extra.x_chips = 1
                return {
                    message = localize('k_reset'),
                    colour = G.C.CHIPS
                }
            end
        end
    end
}