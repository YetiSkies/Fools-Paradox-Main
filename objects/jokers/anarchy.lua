SMODS.Joker {
    key = 'anarchy',
    config = { extra = {} },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 8, y = 0 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local min_rank = 100
            if G.hand and G.hand.cards then
                for i = 1, #G.hand.cards do
                    if G.hand.cards[i].facing ~= 'back' and not G.hand.cards[i].debuff then
                        local id = G.hand.cards[i]:get_id()
                        if id == 14 then id = 11 end
                        if id > 10 and id < 14 then id = 10 end
                        
                        if id < min_rank then
                            min_rank = id
                        end
                    end
                end
            end
            
            if min_rank < 100 then
                return {
                    message = "X" .. min_rank .. " Mult",
                    Xmult_mod = min_rank
                }
            end
        end
    end
}