SMODS.Joker {
    key = 'pentagonal_joker',
    config = { extra = { chips = 0, mult = 0, chip_gain = 5, mult_gain = 5 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 2, y = 2 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chip_gain, card.ability.extra.mult_gain, card.ability.extra.chips, card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            if context.full_hand and #context.full_hand == 5 then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
            end
        end

        if context.joker_main then
            if card.ability.extra.chips > 0 or card.ability.extra.mult > 0 then
                return {
                    message = "Bonus!",
                    chips_mod = card.ability.extra.chips,
                    mult_mod = card.ability.extra.mult,
                    colour = G.C.MULT
                }
            end
        end
    end
}