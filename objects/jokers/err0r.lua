SMODS.Joker {
    key = 'err0r',
    config = { extra = { min = 20, max = 200 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 5, y = 0 }, 

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.min, card.ability.extra.max } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local rand_val = math.floor(card.ability.extra.min + pseudorandom('err0r') * (card.ability.extra.max - card.ability.extra.min + 1))
            if rand_val > card.ability.extra.max then rand_val = card.ability.extra.max end

            return {
                message = "+" .. rand_val,
                chips = rand_val,
                colour = G.C.CHIPS
            }
        end
    end
}