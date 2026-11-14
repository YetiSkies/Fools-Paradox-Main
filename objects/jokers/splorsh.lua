SMODS.Joker {
    key = 'splorsh',
    config = { extra = {} },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 5, y = 5 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            local chips = math.floor(context.other_card:get_chip_bonus() / 2)
            if chips > 0 then
                return {
                    chips = chips,
                    card = card
                }
            end
        end
    end
}