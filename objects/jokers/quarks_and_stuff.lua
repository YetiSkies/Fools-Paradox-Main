SMODS.Joker {
    key = 'quarks_and_stuff',
    config = { extra = {} },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 9, y = 5 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                local hand_name = G.GAME.last_hand_played
                local is_last_hand = (G.GAME.current_round.hands_left == 0)
                
                local chosen_planet = nil
                local fallback_greek = {}
                local normal_planets = {}
                
                for k, v in pairs(G.P_CENTERS) do
                    local is_planet_type = (v.set == 'Planet' or string.find(string.lower(v.set or ''), 'greek'))
                    
                    if is_planet_type then
                        local is_greek = string.find(string.lower(k), 'greek') or string.find(string.lower(v.set or ''), 'greek') or string.find(string.lower(v.name or ''), 'greek')
                        
                        if is_greek then
                            table.insert(fallback_greek, k)
                        else
                            table.insert(normal_planets, k)
                        end
                        
                        if v.config.hand_type == hand_name then
                            if is_last_hand and is_greek then
                                chosen_planet = k
                            elseif not is_last_hand and not is_greek then
                                chosen_planet = k
                            end
                        end
                    end
                end
                
                if not chosen_planet then
                    if is_last_hand and #fallback_greek > 0 then
                        chosen_planet = pseudorandom_element(fallback_greek, pseudoseed('greek'))
                    elseif #normal_planets > 0 then
                        chosen_planet = pseudorandom_element(normal_planets, pseudoseed('normal_planet'))
                    else
                        chosen_planet = 'c_pluto'
                    end
                end
                
                local set_to_use = G.P_CENTERS[chosen_planet] and G.P_CENTERS[chosen_planet].set or 'Planet'
                
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local c = create_card(set_to_use, G.consumeables, nil, nil, nil, nil, nil, chosen_planet)
                        c:add_to_deck()
                        G.consumeables:emplace(c)
                        G.GAME.consumeable_buffer = 0
                        card:juice_up(0.5, 0.5)
                        return true
                    end
                }))
                
                return {
                    message = localize('k_plus_planet'),
                    colour = G.C.SECONDARY_SET.Planet
                }
            end
        end
    end
}