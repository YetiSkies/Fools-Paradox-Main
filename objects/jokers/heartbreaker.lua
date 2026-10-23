SMODS.Joker {
    key = 'heartbreaker',
    config = { extra = { x_mult = 1, gain = 0.1 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 7, y = 3 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.gain, card.ability.extra.x_mult } }
    end,

    calculate = function(self, card, context)
        if context.discard and not context.blueprint then
            if context.other_card:is_suit('Hearts') and not context.other_card.getting_sliced then
                context.other_card.getting_sliced = true 
                card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.gain
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.other_card:start_dissolve()
                        card:juice_up(0.5, 0.5)
                        return true
                    end
                }))
                
                return {
                    message = "X" .. string.format("%.1f", card.ability.extra.x_mult) .. " Mult",
                    colour = G.C.RED
                }
            end
        end

        if context.joker_main then
            if card.ability.extra.x_mult > 1 then
                return {
                    message = "X" .. string.format("%.1f", card.ability.extra.x_mult) .. " Mult",
                    Xmult_mod = card.ability.extra.x_mult
                }
            end
        end
    end
}