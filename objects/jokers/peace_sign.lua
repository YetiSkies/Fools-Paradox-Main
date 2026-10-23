SMODS.Joker {
    key = 'peace_sign',
    config = { extra = { mult_multiplier = 2 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 6, y = 0 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_multiplier } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local max_rank = 0
            if G.hand and G.hand.cards then
                for i = 1, #G.hand.cards do
                    if G.hand.cards[i].facing ~= 'back' and not G.hand.cards[i].debuff then
                        local id = G.hand.cards[i]:get_id()
                        if id == 14 then id = 11 end
                        if id > 10 and id < 14 then id = 10 end
                        
                        if id > max_rank then
                            max_rank = id
                        end
                    end
                end
            end
            if max_rank > 0 then
                local final_mult = max_rank * card.ability.extra.mult_multiplier
                return {
                    message = "+" .. final_mult .. " Mult",
                    mult_mod = final_mult
                }
            end
        end
    end
}