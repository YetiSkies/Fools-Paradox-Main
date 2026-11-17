SMODS.Joker {
    key = 'polygraph_test',
    config = { extra = { chips = 10, mult = 4 } },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 1, y = 11 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local id = context.other_card:get_id()
            if id == 14 or id == 3 or id == 5 or id == 7 or id == 9 then
                return {
                    chips = -card.ability.extra.chips
                }
            elseif id == 2 or id == 4 or id == 6 or id == 8 or id == 10 then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}