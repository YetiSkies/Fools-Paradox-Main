SMODS.Joker {
    key = 'poke',
    config = { extra = { x_chips = 10, loss = 0.1 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 0, y = 11 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_chips, card.ability.extra.loss } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.x_chips > 1 then
            return {
                x_chips = card.ability.extra.x_chips
            }
        end

        if context.after and not context.blueprint and context.scoring_hand and #context.scoring_hand > 0 then
            if card.ability.extra.x_chips > 1 then
                local prev = card.ability.extra.x_chips
                local total_loss = card.ability.extra.loss * #context.scoring_hand
                card.ability.extra.x_chips = math.max(1, math.floor((prev - total_loss) * 10 + 0.5) / 10)
                local actual_loss = math.floor((prev - card.ability.extra.x_chips) * 10 + 0.5) / 10

                if actual_loss > 0 then
                    return {
                        message = "-X" .. actual_loss,
                        colour = G.C.CHIPS,
                        card = card
                    }
                end
            end
        end
    end
}