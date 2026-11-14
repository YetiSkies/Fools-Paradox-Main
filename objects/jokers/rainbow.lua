SMODS.Joker {
    key = 'rainbow',
    config = { extra = { mult = 15 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 7, y = 6 },

    loc_vars = function(self, info_queue, card)
        local count = 0
        local suits = {}
        if G.playing_cards then
            for _, c in ipairs(G.playing_cards) do
                if c.config.center.no_suit then
                    suits['Suitless'] = true
                elseif c.base and c.base.suit then
                    suits[c.base.suit] = true
                end
            end
            for k, v in pairs(suits) do
                count = count + 1
            end
        end
        return { vars = { card.ability.extra.mult, count * card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local count = 0
            local suits = {}
            if G.playing_cards then
                for _, c in ipairs(G.playing_cards) do
                    if c.config.center.no_suit then
                        suits['Suitless'] = true
                    elseif c.base and c.base.suit then
                        suits[c.base.suit] = true
                    end
                end
                for k, v in pairs(suits) do
                    count = count + 1
                end
            end
            
            if count > 0 then
                local final_mult = count * card.ability.extra.mult
                return {
                    message = "+" .. final_mult .. " Mult",
                    mult_mod = final_mult
                }
            end
        end
    end
}