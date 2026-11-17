SMODS.Joker {
    key = 'mystic',
    config = { extra = { odds = 2 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 2, y = 10 },

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable and context.consumeable.ability.set == 'Planet' then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                if pseudorandom('mystic') < (G.GAME.probabilities.normal or 1) / card.ability.extra.odds then
                    local planet_key = context.consumeable.config.center.key
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local c = create_card('Planet', G.consumeables, nil, nil, nil, nil, planet_key, 'mystic')
                            c:add_to_deck()
                            G.consumeables:emplace(c)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    return {
                        message = localize('k_copied_ex'),
                        colour = G.C.SECONDARY_SET.Planet,
                        card = context.blueprint_card or card
                    }
                end
            end
        end
    end
}