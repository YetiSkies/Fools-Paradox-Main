SMODS.Joker {
    key = 'bonus_bob',
    config = { extra = { repetitions = 1 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 5, y = 1 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.repetitions } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            local other_card = context.other_card
            local center_key = other_card.config.center.key
            
            if center_key == 'm_bonus' or center_key == 'm_mult' or center_key == 'm_foolspara_penalty' then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.repetitions,
                    card = card
                }
            end
        end
    end
}