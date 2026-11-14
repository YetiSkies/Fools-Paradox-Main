SMODS.Joker {
    key = 'parasitic_buffoon',
    config = { extra = { odds = 3 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 4, y = 5 },

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            if pseudorandom('parasitic') < (G.GAME.probabilities.normal or 1) / card.ability.extra.odds then
                
                local played_hand = context.scoring_name
                
                local available_hands = {}
                for k, v in pairs(G.GAME.hands) do
                    if v.visible then
                        table.insert(available_hands, k)
                    end
                end

                local hand1, hand2
                if #available_hands > 0 then
                    local idx1 = pseudorandom('para_1', 1, #available_hands)
                    hand1 = available_hands[idx1]
                    table.remove(available_hands, idx1)
                    
                    if #available_hands > 0 then
                        local idx2 = pseudorandom('para_2', 1, #available_hands)
                        hand2 = available_hands[idx2]
                    else
                        hand2 = hand1
                    end
                end

                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Parasite!", colour = G.C.PURPLE})
                        level_up_hand(card, played_hand, nil, -1)
                        return true
                    end
                }))

                if hand1 then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            level_up_hand(card, hand1, nil, 1)
                            return true
                        end
                    }))
                end

                if hand2 then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            level_up_hand(card, hand2, nil, 1)
                            return true
                        end
                    }))
                end
            end
        end
    end
}