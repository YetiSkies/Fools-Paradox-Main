SMODS.Joker {
    key = 'ancient_oak',
    config = { extra = { x_mult = 1, x_mult_gain = 0.5 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 0, y = 6 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult_gain, card.ability.extra.x_mult } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local has_acorn = false
            if context.scoring_hand then
                for _, c in ipairs(context.scoring_hand) do
                    if c:is_suit('foolspara_Acorns') then
                        has_acorn = true
                        break
                    end
                end
            end

            if has_acorn then
                card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_gain
                return {
                    message = "Upgraded!",
                    colour = G.C.RED
                }
            else
                if card.ability.extra.x_mult > 1 then
                    card.ability.extra.x_mult = 1
                    return {
                        message = "Reset!",
                        colour = G.C.RED
                    }
                end
            end
        end

        if context.joker_main then
            if card.ability.extra.x_mult > 1 then
                return {
                    x_mult = card.ability.extra.x_mult
                }
            end
        end
    end
}