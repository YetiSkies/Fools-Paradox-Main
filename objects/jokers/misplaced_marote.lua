SMODS.Joker {
    key = 'misplaced_marotte',
    config = { extra = { mult = 0, mult_gain = 5 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 3, y = 6 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            if context.scoring_name == 'Spectrum' or context.scoring_name == 'foolspara_spectrum' or context.scoring_name == 'spa_Spectrum' then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
            end
        end

        if context.joker_main then
            if card.ability.extra.mult > 0 then
                return {
                    message = "+" .. card.ability.extra.mult .. " Mult",
                    mult_mod = card.ability.extra.mult
                }
            end
        end
    end
}