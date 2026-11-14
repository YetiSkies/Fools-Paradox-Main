SMODS.Joker {
    key = 'petal_joker',
    config = { extra = { mult = 0, mult_gain = 5 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 1, y = 7 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:is_suit('foolspara_Roses') then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                return {
                    extra = {
                        focus = card,
                        message_card = card,
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT
                    },
                    card = card,
                    message_card = card
                }
            end
        end

        if context.joker_main then
            if card.ability.extra.mult > 0 then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}