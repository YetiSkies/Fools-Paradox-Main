SMODS.Joker {
    key = 'fastest_route',
    config = { extra = {} },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 5, y = 2 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
    end
}

if not SMODS.kranlaxs_fastest_route_hook then
    local orig_get_straight = get_straight
    function get_straight(hand)
        local ret = orig_get_straight(hand)
        if #ret > 0 then return ret end
        
        local has_fastest = false
        if G.jokers and G.jokers.cards then
            for _, j in ipairs(G.jokers.cards) do
                if j.config.center.key == 'j_foolspara_fastest_route' and not j.debuff then
                    has_fastest = true
                    break
                end
            end
        end
        
        if has_fastest then
            local t = {}
            for i=1, #hand do
                if hand[i].ability.effect ~= 'Stone Card' then
                    local rank = hand[i].base.value
                    local r = (rank == 'Ace' and 14) or (rank == 'King' and 13) or (rank == 'Queen' and 12) or (rank == 'Jack' and 11) or tonumber(rank)
                    t[r] = t[r] or {}
                    table.insert(t[r], hand[i])
                    if rank == 'Ace' then
                        t[1] = t[1] or {}
                        table.insert(t[1], hand[i])
                    end
                end
            end
            
            local skip = next(find_joker('Shortcut')) and 1 or 0
            local res = {}
            
            for i = 14, 1, -1 do
                local straight_cand = {}
                local gaps = 0
                for j = i, 1, -1 do
                    if t[j] then
                        table.insert(straight_cand, t[j][1])
                    else
                        gaps = gaps + 1
                        if gaps > skip then break end
                    end
                    if #straight_cand >= 3 then
                        table.insert(res, straight_cand)
                        return res
                    end
                end
            end
        end
        
        return ret
    end
    SMODS.kranlaxs_fastest_route_hook = true
end