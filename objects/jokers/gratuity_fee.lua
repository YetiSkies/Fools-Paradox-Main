SMODS.Joker {
    key = 'gratuity_fee',
    config = { extra = { cost = 1, x_mult = 1.1 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 1, y = 1 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cost, card.ability.extra.x_mult } }
    end,

    calculate = function(self, card, context)
        if context.other_joker then
            local other = context.other_joker
            
            if other == card or (context.blueprint_card and other == context.blueprint_card) then return end
            if other.config.center.key == 'j_foolspara_gratuity_fee' then return end

            local is_scoring = false
            local visited = {} 
            
            local function check_config(t)
                if type(t) ~= 'table' then return false end
                if visited[t] then return false end 
                visited[t] = true
                
                for k, v in pairs(t) do
                    if type(k) == 'string' then
                        local kl = string.lower(k)
                        if kl == 'mult' or kl == 'xmult' or kl == 'x_mult' or kl == 'chips' or kl == 'xchips' or kl == 'x_chips' or kl == 'h_mult' or kl == 'h_x_mult' or kl == 'h_chips' then return true end
                    end
                    if type(v) == 'table' and check_config(v) then return true end
                end
                return false
            end
            
            if check_config(other.ability) or check_config(other.config) then
                is_scoring = true
            end

            if is_scoring then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        ease_dollars(-card.ability.extra.cost)
                        card:juice_up(0.5, 0.5)
                        return true
                    end
                }))
                
                return {
                    message = localize{type='variable', key='a_xmult', vars={card.ability.extra.x_mult}},
                    x_mult = card.ability.extra.x_mult 
                }
            end
        end
    end
}