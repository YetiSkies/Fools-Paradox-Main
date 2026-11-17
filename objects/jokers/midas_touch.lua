SMODS.Joker {
    key = 'midas_touch',
    config = { extra = { odds = 10 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 2, y = 9 },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
        return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and context.end_of_round and not context.blueprint then
            local c = context.other_card
            local is_gold = (SMODS.has_enhancement and SMODS.has_enhancement(c, 'm_gold')) or (c and c.config and c.config.center == G.P_CENTERS.m_gold)

            if is_gold and not c.debuff then
                if pseudorandom('midas_touch') < (G.GAME.probabilities.normal or 1) / card.ability.extra.odds then
                    local idx = nil
                    for i, hc in ipairs(G.hand.cards) do
                        if hc == c then
                            idx = i
                            break
                        end
                    end

                    if idx then
                        local targets = {}
                        if G.hand.cards[idx - 1] then targets[#targets + 1] = G.hand.cards[idx - 1] end
                        if G.hand.cards[idx + 1] then targets[#targets + 1] = G.hand.cards[idx + 1] end

                        if #targets > 0 then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    for _, t in ipairs(targets) do
                                        t:set_ability(G.P_CENTERS.m_gold, nil, true)
                                        t:juice_up(0.3, 0.3)
                                    end
                                    card:juice_up(0.5, 0.5)
                                    return true
                                end
                            }))
                            return {
                                message = "Gold!",
                                colour = G.C.MONEY,
                                card = card
                            }
                        end
                    end
                end
            end
        end
    end
}