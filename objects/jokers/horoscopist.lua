SMODS.Joker {
    key = 'horoscopist',
    config = { extra = {} },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 0, y = 13 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not (context.blueprint_card or card).getting_sliced then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                local target = context.blueprint_card or card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local c = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, 'horoscopist')
                        c:add_to_deck()
                        G.consumeables:emplace(c)
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
                card_eval_status_text(target, 'extra', nil, nil, nil, {
                    message = localize('k_plus_planet'),
                    colour = G.C.SECONDARY_SET.Planet
                })
            end
        end
    end
}