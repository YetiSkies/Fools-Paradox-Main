SMODS.Joker {
    key = 'jinx',
    config = { extra = {} },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 4, y = 2 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        local new_card = create_card('Joker', G.jokers, nil, 'foolspara_parallel', nil, nil, nil, 'jinx')
                        new_card:add_to_deck()
                        G.jokers:emplace(new_card)
                        G.GAME.joker_buffer = 0
                        return true
                    end
                }))
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Jinx!", colour = G.C.BLUE})
            end
        end
    end
}