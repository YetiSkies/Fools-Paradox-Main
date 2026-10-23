SMODS.Joker {
    key = 'corruption',
    config = { extra = { min = 1.01, max = 5 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 3, y = 0 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.min, card.ability.extra.max } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local rand_val = card.ability.extra.min + pseudorandom('corruption') * (card.ability.extra.max - card.ability.extra.min)
            local formatted_val = tonumber(string.format("%.2f", rand_val))
            
            return {
                message = "X" .. formatted_val .. " Mult",
                Xmult_mod = formatted_val
            }
        end
    end
}