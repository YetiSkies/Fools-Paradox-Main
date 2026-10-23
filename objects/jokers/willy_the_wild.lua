SMODS.Joker {
    key = 'willy_the_wild',
    config = { extra = {} },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 0, y = 1 }, 

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_wild
        return { vars = {} }
    end,

    update = function(self, card, dt)
        if not card.debuff then
            if G.shop_jokers and G.shop_jokers.cards then
                for _, c in ipairs(G.shop_jokers.cards) do
                    if c.base and c.base.suit and c.config.center.key ~= 'm_wild' then
                        c:set_ability(G.P_CENTERS.m_wild, true, nil)
                    end
                end
            end
            
            if G.pack_cards and G.pack_cards.cards then
                for _, c in ipairs(G.pack_cards.cards) do
                    if c.base and c.base.suit and c.config.center.key ~= 'm_wild' then
                        c:set_ability(G.P_CENTERS.m_wild, true, nil)
                    end
                end
            end
        end
    end
}