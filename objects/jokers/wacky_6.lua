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
        if G.playing_cards and not card.debuff then
            for _, c in ipairs(G.playing_cards) do
                if c.base.value == '6' and not c.wacky_6_applied then
                    c.wacky_6_applied = true
                    
                    if pseudorandom('wacky6_roll') < 0.5 then
                        c:set_ability(G.P_CENTERS.m_bonus, true, nil)
                    else
                        c:set_ability(G.P_CENTERS.m_foolspara_penalty, true, nil)
                    end
                end
            end
        end
    end
}