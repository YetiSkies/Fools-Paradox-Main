SMODS.Joker {
    key = 'rainbow_sorbet',
    config = { extra = { chips = 50, mult = 10, dollars = 5, chip_loss = 10, mult_loss = 2, dollar_loss = 1 } },
    rarity = 1, 
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 9, y = 5 },

    loc_vars = function(self, info_queue, card)
        return { vars = { math.max(0, card.ability.extra.chips), math.max(0, card.ability.extra.mult), math.max(0, card.ability.extra.dollars), card.ability.extra.chip_loss, card.ability.extra.mult_loss, card.ability.extra.dollar_loss } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local roll = pseudorandom('sorbet_roll')
            
            if roll < 0.333 then
                local current_chips = math.max(0, card.ability.extra.chips)
                if current_chips > 0 then
                    return {
                        chips = current_chips
                    }
                end
            elseif roll < 0.666 then
                local current_mult = math.max(0, card.ability.extra.mult)
                if current_mult > 0 then
                    return {
                        mult = current_mult
                    }
                end
            else
                local current_dollars = math.max(0, card.ability.extra.dollars)
                if current_dollars > 0 then
                    return {
                        dollars = current_dollars
                    }
                end
            end
        end

        if context.after and not context.blueprint then
            local melted = false
            
            if card.ability.extra.chips > 0 then
                card.ability.extra.chips = math.max(0, card.ability.extra.chips - card.ability.extra.chip_loss)
                melted = true
            end

            if card.ability.extra.mult > 0 then
                card.ability.extra.mult = math.max(0, card.ability.extra.mult - card.ability.extra.mult_loss)
                melted = true
            end
            
            if card.ability.extra.dollars > 0 then
                card.ability.extra.dollars = math.max(0, card.ability.extra.dollars - card.ability.extra.dollar_loss)
                melted = true
            end

            if melted then
                return {
                    message = "Melted!",
                    colour = G.C.RED
                }
            end
        end
    end
}