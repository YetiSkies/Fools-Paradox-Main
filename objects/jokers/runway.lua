SMODS.Joker {
    key = 'runway_model',
    config = { extra = { chips = 0, mult = 0, chip_gain = 10, mult_gain = 5 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 8, y = 5 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chip_gain, card.ability.extra.mult_gain, card.ability.extra.chips, card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            if context.scoring_name == 'Spectrum' or context.scoring_name == 'foolspara_spectrum' or context.scoring_name == 'spa_Spectrum' then
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
                SMODS.calculate_effect({
                    chip_mod = card.ability.extra.chips, 
                    message = localize{type='variable', key='a_chips', vars={card.ability.extra.chips}}
                }, card)
                
                return {
                    mult_mod = card.ability.extra.mult,
                    message = localize{type='variable', key='a_mult', vars={card.ability.extra.mult}}
                }
            end
        end
    end
}