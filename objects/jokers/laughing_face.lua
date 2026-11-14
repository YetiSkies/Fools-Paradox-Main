SMODS.Joker {
    key = 'laughing_face',
    config = { extra = { mult = 4 } },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 5, y = 6 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local id = context.other_card:get_id()
            local val = context.other_card.base.value
            
            if id == 14 or id == 2 or id == 7 or id == 11 or val == 'Fool' or val == 'foolspara_Fool' then
                return {
                    mult = card.ability.extra.mult,
                    card = card
                }
            end
        end
    end
}