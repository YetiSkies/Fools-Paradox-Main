SMODS.Joker {
    key = 'multi_matt',
    config = { extra = { repetitions = 1 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 1, y = 5 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.repetitions } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            local c = context.other_card
            local center = c and c.config and c.config.center
            local center_key = center and center.key or ''
            local orig_key = center and center.original_key or ''
            if center_key == 'm_mult' or center_key == 'm_foolspara_div' or center_key == 'm_div' or orig_key == 'div' or (SMODS.has_enhancement and (SMODS.has_enhancement(c, 'm_mult') or SMODS.has_enhancement(c, 'm_foolspara_div'))) then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.repetitions,
                    card = card
                }
            end
        end
    end
}