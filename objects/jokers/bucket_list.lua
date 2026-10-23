SMODS.Joker {
    key = 'bucket_list',
    config = { extra = { mult_per_hand = 10 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 7, y = 1 }, 

    loc_vars = function(self, info_queue, card)
        local count = 0
        if G.GAME and G.GAME.hands then
            for k, v in pairs(G.GAME.hands) do
                if v.played and v.played > 0 and v.visible then
                    count = count + 1
                end
            end
        end
        return { vars = { card.ability.extra.mult_per_hand, count * card.ability.extra.mult_per_hand } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local count = 0
            for k, v in pairs(G.GAME.hands) do
                if v.played and v.played > 0 and v.visible then
                    count = count + 1
                end
            end

            if count > 0 then
                local final_mult = count * card.ability.extra.mult_per_hand
                return {
                    message = "+" .. final_mult .. " Mult",
                    mult_mod = final_mult
                }
            end
        end
    end
}