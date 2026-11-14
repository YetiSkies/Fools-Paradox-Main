SMODS.Joker {
    key = 'golden_ratio',
    config = { extra = { repetitions = 1 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 7, y = 4 },

    loc_vars = function(self, info_queue, card) 
        return { vars = { card.ability.extra.repetitions } } 
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            local c = context.other_card
            local id = c:get_id()
            local is_rankless = (SMODS.has_no_rank and SMODS.has_no_rank(c)) or c.config.center.no_rank or c.ability.effect == 'Stone Card' or id <= 0
            if is_rankless or id == 14 or id == 3 or id == 6 or id == 8 or id == 9 then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.repetitions,
                    card = card
                }
            end
        end
    end
}