SMODS.Joker {
    key = 'double_edged_spade',
    config = { extra = {} },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 2, y = 12 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local c = context.other_card
            local is_rankless = (SMODS.has_no_rank and SMODS.has_no_rank(c)) or c.config.center.no_rank or c.ability.effect == 'Stone Card' or c:get_id() <= 0

            if not is_rankless and c:is_suit('Spades') and c.base and c.base.nominal and c.base.nominal > 0 then
                local val = c.base.nominal
                return {
                    mult = val,
                    chips = -val
                }
            end
        end
    end
}