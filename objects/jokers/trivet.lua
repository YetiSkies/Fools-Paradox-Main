SMODS.Joker {
    key = 'trivet',
    config = { extra = { x_mult = 0.5 } },
    rarity = 4,
    cost = 20,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 7, y = 13 },

    loc_vars = function(self, info_queue, card)
        local right_count = 0
        if G.jokers and G.jokers.cards then
            local found = false
            for i = 1, #G.jokers.cards do
                if found then
                    right_count = right_count + 1
                elseif G.jokers.cards[i] == card then
                    found = true
                end
            end
        end
        local current_x = 1 + (card.ability.extra.x_mult * right_count)
        return { vars = { card.ability.extra.x_mult, current_x } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and G.jokers and G.jokers.cards then
            local right_count = 0
            local found = false
            for i = 1, #G.jokers.cards do
                if found then
                    right_count = right_count + 1
                elseif G.jokers.cards[i] == card then
                    found = true
                end
            end

            local total_x = 1 + (card.ability.extra.x_mult * right_count)
            if total_x > 1 then
                return {
                    x_mult = total_x
                }
            end
        end
    end
}