SMODS.Joker {
    key = 'silver_jester',
    config = { extra = { dollars = 1, cards_left = 0 } },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 1, y = 6 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            card.ability.extra.cards_left = (G.hand and G.hand.cards) and #G.hand.cards or 0
        end
    end,

    calc_dollar_bonus = function(self, card)
        local count = card.ability.extra.cards_left or 0
        local bonus = count * card.ability.extra.dollars
        card.ability.extra.cards_left = 0
        if bonus > 0 then
            return bonus
        end
    end
}