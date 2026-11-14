SMODS.Joker {
    key = 'star_chart',
    config = { extra = { chips = 20 } },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 8, y = 5 },

    loc_vars = function(self, info_queue, card)
        local count = 0
        if G.GAME and G.GAME.consumeable_usage then
            for k, v in pairs(G.GAME.consumeable_usage) do
                if v and v.set == 'Planet' then
                    count = count + 1
                end
            end
        end
        return { vars = { card.ability.extra.chips, count * card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local count = 0
            if G.GAME and G.GAME.consumeable_usage then
                for k, v in pairs(G.GAME.consumeable_usage) do
                    if v and v.set == 'Planet' then
                        count = count + 1
                    end
                end
            end
            
            if count > 0 then
                local final_chips = count * card.ability.extra.chips
                return {
                    message = "+" .. final_chips .. " Chips",
                    chips_mod = final_chips,
                    colour = G.C.CHIPS
                }
            end
        end
    end
}