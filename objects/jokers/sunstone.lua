SMODS.Joker {
    key = 'sunstone',
    config = { extra = { chips = 75, odds = 2 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 2, y = 3 },

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit('foolspara_Shields') then
                if pseudorandom('sunstone') < (G.GAME.probabilities.normal or 1) / card.ability.extra.odds then
                    return {
                        chips = card.ability.extra.chips,
                        card = card
                    }
                end
            end
        end
    end
}