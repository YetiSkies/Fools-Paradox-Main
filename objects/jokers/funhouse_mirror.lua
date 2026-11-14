SMODS.Joker {
    key = 'funhouse_mirror',
    config = { extra = {} },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 3, y = 7 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit('Diamonds') then
                local base_chips = context.other_card:get_chip_bonus()
                local roll = pseudorandom('funhouse_mirror')
                
                if roll < 0.5 then
                    return {
                        chips = base_chips,
                        card = card
                    }
                else
                    return {
                        chips = -math.floor(base_chips / 2),
                        card = card
                    }
                end
            end
        end
    end
}