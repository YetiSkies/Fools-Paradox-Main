SMODS.Joker {
    key = 'rose_quartz',
    config = { extra = { mult = 25, odds = 2 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 1, y = 3 },

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit('foolspara_Roses') then
                if pseudorandom('rose_quartz') < (G.GAME.probabilities.normal or 1) / card.ability.extra.odds then
                    return {
                        mult = card.ability.extra.mult,
                        card = card
                    }
                end
            end
        end
    end
}