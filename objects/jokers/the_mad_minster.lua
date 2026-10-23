SMODS.Joker {
    key = 'the_mad_minister',
    config = { extra = { discount = -50 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 9, y = 0 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.discount_percent = (G.GAME.discount_percent or 0) + card.ability.extra.discount
        
        for _, area in ipairs({G.shop_jokers, G.shop_booster, G.shop_vouchers}) do
            if area and area.cards then
                for _, c in ipairs(area.cards) do
                    c:set_cost()
                end
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.discount_percent = (G.GAME.discount_percent or 0) - card.ability.extra.discount
        
        for _, area in ipairs({G.shop_jokers, G.shop_booster, G.shop_vouchers}) do
            if area and area.cards then
                for _, c in ipairs(area.cards) do
                    c:set_cost()
                end
            end
        end
    end,

    update = function(self, card, dt)
        if G.GAME and G.GAME.current_round and card.area == G.jokers and not card.debuff then
            G.GAME.current_round.reroll_cost = 0
        end
    end
}
