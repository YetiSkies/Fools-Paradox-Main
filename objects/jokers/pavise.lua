SMODS.Joker {
    key = 'pavise',
    config = { extra = { chip_gain = 10 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 4, y = 6 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chip_gain } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit('foolspara_Shields') then
                context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + card.ability.extra.chip_gain
                return {
                    extra = {message = localize('k_upgrade_ex'), colour = G.C.CHIPS},
                    card = card
                }
            end
        end
    end
}