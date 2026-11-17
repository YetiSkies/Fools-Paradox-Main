SMODS.Joker {
    key = 'pocket_change',
    config = { extra = { chips = 100, chip_loss = 5 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 9, y = 10 },

    loc_vars = function(self, info_queue, card)
        return { vars = { math.max(0, card.ability.extra.chips), card.ability.extra.chip_loss } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.chips > 0 then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            if card.ability.extra.chips > 0 then
                card.ability.extra.chips = math.max(0, card.ability.extra.chips - card.ability.extra.chip_loss)
                return {
                    message = "-" .. card.ability.extra.chip_loss,
                    colour = G.C.CHIPS
                }
            end
        end
    end
}