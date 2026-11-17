SMODS.Joker {
    key = 'royal_mail',
    config = { extra = { dollars = 5 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 9, y = 9 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        if context.discard and not context.other_card.debuff and context.other_card:is_face() then
            return {
                dollars = card.ability.extra.dollars,
                card = context.blueprint_card or card
            }
        end
    end
}