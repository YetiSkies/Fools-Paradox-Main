SMODS.Joker {
    key = 'fascimile',
    config = { extra = {} },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 5, y = 3 },

    loc_vars = function(self, info_queue, card)
        local is_copiable = false
        if G.jokers and G.jokers.cards then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card and i > 1 then
                    local left_joker = G.jokers.cards[i - 1]
                    if left_joker and left_joker.config.center.blueprint_compat then
                        is_copiable = true
                    end
                    break
                end
            end
        end
        
        return {
            vars = {},
            main_end = {
                {n=G.UIT.C, config={align="bm", minh=0.4}, nodes={
                    {n=G.UIT.C, config={ref_table=self, align="m", colour=is_copiable and G.C.GREEN or G.C.RED, r=0.1, padding=0.05, minw=2.0}, nodes={
                        {n=G.UIT.T, config={text=is_copiable and localize('k_compatible') or localize('k_incompatible'), colour=G.C.UI.TEXT_LIGHT, scale=0.32, shadow=true}}
                    }}
                }}
            }
        }
    end,

    calculate = function(self, card, context)
        local my_pos = nil
        if G.jokers and G.jokers.cards then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then my_pos = i; break end
            end
        end
        
        if my_pos and my_pos > 1 then
            local left_joker = G.jokers.cards[my_pos - 1]
            if left_joker and left_joker ~= card and left_joker.config.center.blueprint_compat then
                context.blueprint = (context.blueprint or 0) + 1
                context.blueprint_card = context.blueprint_card or card
                if context.blueprint > 1 then return end
                
                local ret = left_joker:calculate_joker(context)
                if ret then
                    ret.card = card
                    return ret
                end
            end
        end
    end
}