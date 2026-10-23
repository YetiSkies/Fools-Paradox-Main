SMODS.Joker {
    key = 'prime_pym',
    config = { extra = { mult = 7 } },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 3, y = 1 }, 

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local id = context.other_card:get_id()
            if id == 2 or id == 3 or id == 5 or id == 7 or id == 11 or id == 13 then
                return {
                    mult = card.ability.extra.mult,
                    card = card
                }
            end
        end
    end
}