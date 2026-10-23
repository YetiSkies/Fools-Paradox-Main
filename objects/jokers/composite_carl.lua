SMODS.Joker {
    key = 'composite_carl',
    config = { extra = { mult = 40 } },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 6, y = 1 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local id = context.other_card:get_id()
            if id == 4 or id == 6 or id == 8 or id == 9 or id == 10 or id == 12 or id == 14 then
                return {
                    mult = card.ability.extra.mult,
                    card = card
                }
            end
        end
    end
}