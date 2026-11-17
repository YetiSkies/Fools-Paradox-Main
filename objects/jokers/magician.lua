SMODS.Joker {
    key = 'magician',
    config = { extra = { x_mult = 1.5 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 5, y = 8 },

    loc_vars = function(self, info_queue, card)
        local count = 0
        if G.GAME and G.GAME.hands then
            for _, v in pairs(G.GAME.hands) do
                if v.played_this_round and v.played_this_round > 0 then
                    count = count + 1
                end
            end
        end
        local current_x = card.ability.extra.x_mult * count
        return { vars = { card.ability.extra.x_mult, current_x } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local count = 0
            if G.GAME and G.GAME.hands then
                for k, v in pairs(G.GAME.hands) do
                    if (v.played_this_round and v.played_this_round > 0) or context.scoring_name == k then
                        count = count + 1
                    end
                end
            end

            return {
                x_mult = card.ability.extra.x_mult * count
            }
        end
    end
}