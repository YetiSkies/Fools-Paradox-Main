SMODS.Joker {
    key = 'enigma',
    config = { extra = { debt = 5 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 9, y = 8 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.debt } }
    end,

    calculate = function(self, card, context)
        if context.before and G.GAME.dollars <= -card.ability.extra.debt then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local c = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'enigma')
                        c:add_to_deck()
                        G.consumeables:emplace(c)
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
                return {
                    message = localize('k_plus_spectral'),
                    colour = G.C.SECONDARY_SET.Spectral,
                    card = context.blueprint_card or card
                }
            end
        end
    end
}