SMODS.Joker {
    key = 'golden_goose',
    config = { extra = { sell_gain = 3 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 5, y = 5 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.sell_gain } }
    end,

    update = function(self, card, dt)
        card.sell_cost = 0
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition then
            local effected = false
            if G.jokers and G.jokers.cards then
                for _, j in ipairs(G.jokers.cards) do
                    if j ~= card then
                        j.ability.extra_value = (j.ability.extra_value or 0) + card.ability.extra.sell_gain
                        j:set_cost()
                        effected = true
                    end
                end
            end
            
            if effected then
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MONEY
                }
            end
        end
    end
}