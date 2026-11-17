SMODS.Joker {
    key = 'landscape',
    config = { extra = { mult_factor = 3 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 4, y = 9 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_factor } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local c = context.other_card
            local is_rankless = (SMODS.has_no_rank and SMODS.has_no_rank(c)) or c.config.center.no_rank or c.ability.effect == 'Stone Card' or c:get_id() <= 0

            if not is_rankless and not c:is_face() and c.base and c.base.nominal and c.base.nominal > 0 then
                local extra_chips = c.base.nominal * (card.ability.extra.mult_factor - 1)
                if extra_chips > 0 then
                    return {
                        chips = extra_chips
                    }
                end
            end
        end
    end
}