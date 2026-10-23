SMODS.Joker {
    key = 'wacky_6',
    config = { extra = {} },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 7, y = 2 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    update = function(self, card, dt)
        if G.playing_cards and card.area == G.jokers and not card.debuff then
            local penalty_center = G.P_CENTERS.m_foolspara_penalty or G.P_CENTERS.m_penalty
            
            for _, c in ipairs(G.playing_cards) do
                if c.base.value == '6' and not c.wacky_6_applied then
                    c.wacky_6_applied = true
                    
                    if pseudorandom('wacky6_roll') < 0.5 then
                        c:set_ability(G.P_CENTERS.m_bonus, true, nil)
                    else
                        if penalty_center then
                            c:set_ability(penalty_center, true, nil)
                        else
                            c:set_ability(G.P_CENTERS.m_bonus, true, nil)
                        end
                    end
                end
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if G.playing_cards then
            for _, c in ipairs(G.playing_cards) do
                if c.base.value == '6' and c.wacky_6_applied then
                    c.wacky_6_applied = false
                    c:set_ability(G.P_CENTERS.c_base, true, nil)
                end
            end
        end
    end
}
