SMODS.Joker {
    key = 'lucky_larry',
    config = { extra = { odds = 3 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 6, y = 3 },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_lucky
        return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if pseudorandom('lucky_larry') < (G.GAME.probabilities.normal or 1) / card.ability.extra.odds then
                local other = context.other_card
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        other:set_ability(G.P_CENTERS.m_lucky, true, nil)
                        other:juice_up(0.5, 0.5)
                        card_eval_status_text(other, 'extra', nil, nil, nil, {message = "Lucky!", colour = G.C.GREEN})
                        return true
                    end
                }))
            end
        end
    end
}