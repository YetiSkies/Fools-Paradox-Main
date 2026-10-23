SMODS.Joker {
    key = 'crazy_8',
    config = { extra = {} },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 6, y = 2 }, 

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local transformed = false
            if context.full_hand then
                for _, c in ipairs(context.full_hand) do
                    if c:get_id() == 8 then
                        local enhancements = {'m_bonus', 'm_mult', 'm_wild', 'm_glass', 'm_steel', 'm_stone', 'm_gold', 'm_lucky'}
                        local new_enhance = pseudorandom_element(enhancements, pseudoseed('crazy8_roll'))
                        
                        c:set_ability(G.P_CENTERS[new_enhance], true, nil)
                        c:juice_up(0.5, 0.5)
                        transformed = true
                    end
                end
            end
            
            if transformed then
                return {
                    message = "Crazy!",
                    colour = G.C.PURPLE
                }
            end
        end
    end
}