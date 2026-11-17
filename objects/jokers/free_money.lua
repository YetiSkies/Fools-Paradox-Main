SMODS.Joker {
    key = 'free_money',
    config = { extra = { destroy_count = 5 } },
    rarity = 'foolspara_parallel',
    cost = 0,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 5, y = 9 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy_count } }
    end,

    set_ability = function(self, card, initial, delay_sprites)
        card.cost = 0
        card.sell_cost = 30 + (card.ability and card.ability.extra_value or 0)
        card.sell_cost_label = card.facing == 'back' and '?' or card.sell_cost
    end,

    calculate = function(self, card, context)
        if context.selling_self and not context.blueprint then
            local pool = {}
            if G.hand and G.hand.cards then
                for _, c in ipairs(G.hand.cards) do
                    if not c.getting_sliced and not c.destroyed then
                        pool[#pool + 1] = c
                    end
                end
            end
            if G.deck and G.deck.cards then
                for _, c in ipairs(G.deck.cards) do
                    if not c.getting_sliced and not c.destroyed then
                        pool[#pool + 1] = c
                    end
                end
            end

            local to_destroy = {}
            local count = math.min(card.ability.extra.destroy_count, #pool)
            for i = 1, count do
                local idx = pseudorandom('free_money_del', 1, #pool)
                to_destroy[#to_destroy + 1] = pool[idx]
                table.remove(pool, idx)
            end

            if #to_destroy > 0 then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        if SMODS.destroy_cards then
                            SMODS.destroy_cards(to_destroy)
                        else
                            for _, c in ipairs(to_destroy) do
                                if c.ability and c.ability.name == 'Glass Card' then
                                    c:shatter()
                                else
                                    c:start_dissolve()
                                end
                            end
                            SMODS.calculate_context({ remove_playing_cards = true, removed = to_destroy })
                        end
                        return true
                    end
                }))
            end
        end
    end
}

if not SMODS.kranlaxs_free_money_hook then
    local orig_set_cost = Card.set_cost
    function Card:set_cost()
        orig_set_cost(self)
        if self.config and self.config.center and self.config.center.key == 'j_foolspara_free_money' then
            self.cost = 0
            self.sell_cost = 30 + (self.ability and self.ability.extra_value or 0)
            self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
        end
    end
    SMODS.kranlaxs_free_money_hook = true
end