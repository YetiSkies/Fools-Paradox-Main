SMODS.Joker {
    key = 'athame',
    config = { extra = { multiplier = 2 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.multiplier } }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then 
                    my_pos = i 
                    break 
                end
            end
            
            if my_pos and my_pos < #G.jokers.cards then
                local right_joker = G.jokers.cards[my_pos + 1]
                
                if not right_joker.ability.eternal and not right_joker.getting_sliced then
                    right_joker.getting_sliced = true
                    local gain = right_joker.sell_cost * card.ability.extra.multiplier
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:juice_up(0.8, 0.8)
                            right_joker:start_dissolve()
                            ease_dollars(gain)
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+$"..gain, colour = G.C.MONEY})
                            return true
                        end
                    }))
                end
            end
        end
    end
}