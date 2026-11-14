SMODS.Joker {
    key = 'the_five_senses',
    config = { extra = {} },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 7, y = 5 },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_negative
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            if G.GAME.current_round.hands_played == 0 and context.full_hand and #context.full_hand == 1 then
                if context.full_hand[1]:get_id() == 5 and not context.full_hand[1].getting_sliced then
                    context.full_hand[1].getting_sliced = true
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            context.full_hand[1]:start_dissolve()
                            card:juice_up(0.5, 0.5)
                            return true
                        end
                    }))
                    
                    for i = 1, 2 do
                        if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local c = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, 'five_senses')
                                    c:set_edition({negative = true}, true)
                                    c:add_to_deck()
                                    G.consumeables:emplace(c)
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end
                            }))
                        end
                    end
                    
                    return {
                        message = "Senses!",
                        colour = G.C.SECONDARY_SET.Planet
                    }
                end
            end
        end
    end
}