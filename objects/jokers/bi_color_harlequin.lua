SMODS.Joker {
    key = 'bi_color_harlequin',
    config = { extra = { chips = 0, mult = 0, hand_mult = 2, hand_chips = 5, discard_chips = 10, discard_mult = 1 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 4, y = 8 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hand_mult, card.ability.extra.hand_chips, card.ability.extra.discard_chips, card.ability.extra.discard_mult, card.ability.extra.chips, card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            card.ability.extra.mult = math.max(0, card.ability.extra.mult + card.ability.extra.hand_mult)
            card.ability.extra.chips = math.max(0, card.ability.extra.chips - card.ability.extra.hand_chips)
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
        end

        if context.pre_discard and not context.blueprint then
            card.ability.extra.chips = math.max(0, card.ability.extra.chips + card.ability.extra.discard_chips)
            card.ability.extra.mult = math.max(0, card.ability.extra.mult - card.ability.extra.discard_mult)
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
        end

        if context.joker_main then
            local res = {}
            if card.ability.extra.chips > 0 then
                res.chips = card.ability.extra.chips
            end
            if card.ability.extra.mult > 0 then
                res.mult = card.ability.extra.mult
            end
            if res.chips or res.mult then
                return res
            end
        end
    end
}