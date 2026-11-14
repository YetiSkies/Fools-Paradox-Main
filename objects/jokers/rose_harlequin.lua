SMODS.Joker {
    key = 'rose_harlequin',
    config = { extra = { x_chips = 1, gain = 0.2 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 8, y = 4 },

    loc_vars = function(self, info_queue, card) 
        return { vars = { card.ability.extra.x_chips, card.ability.extra.gain } } 
    end,

    update = function(self, card, dt)
        if G.playing_cards then
            local count = 0
            local rg_center = G.P_CENTERS.m_foolspara_rose_gold or G.P_CENTERS.m_rose_gold
            for _, c in ipairs(G.playing_cards) do
                if c.config.center == rg_center then
                    count = count + 1
                end
            end
            card.ability.extra.x_chips = 1 + (count * card.ability.extra.gain)
        end
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if card.ability.extra.x_chips > 1 then
                return {
                    x_chips = card.ability.extra.x_chips
                }
            end
        end
    end
}