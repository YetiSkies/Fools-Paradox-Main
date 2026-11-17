SMODS.Joker {
    key = 'blackbeard',
    config = { extra = { mult_factor = 2 } },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 6, y = 11 },

    loc_vars = function(self, info_queue, card)
        local sell_val = 0
        if G.jokers and G.jokers.cards then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card and G.jokers.cards[i].ability then
                    sell_val = sell_val + (G.jokers.cards[i].sell_cost or 0)
                end
            end
        end
        return { vars = { card.ability.extra.mult_factor, sell_val * card.ability.extra.mult_factor } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local sell_val = 0
            if G.jokers and G.jokers.cards then
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] ~= card and G.jokers.cards[i].ability then
                        sell_val = sell_val + (G.jokers.cards[i].sell_cost or 0)
                    end
                end
            end

            local total_chips = sell_val * card.ability.extra.mult_factor
            if total_chips > 0 then
                return {
                    chips = total_chips
                }
            end
        end
    end
}