local function count_active_inflation()
    if G.STAGE ~= G.STAGES.RUN or not G.jokers or not G.jokers.cards then
        return 0
    end
    local count = 0
    for _, j in ipairs(G.jokers.cards) do
        if j and j.config and j.config.center and j.config.center.key == 'j_foolspara_inflation' and not j.debuff then
            count = count + 1
        end
    end
    return count
end

local function update_shop_prices()
    local areas = { G.shop_jokers, G.shop_vouchers, G.shop_booster }
    for _, area in ipairs(areas) do
        if area and area.cards then
            for _, c in ipairs(area.cards) do
                if c and c.set_cost then
                    c:set_cost()
                end
            end
        end
    end
end

SMODS.Joker {
    key = 'inflation',
    config = { extra = { payout_mult = 2, shop_mult = 3, sold_mult = 2 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 0, y = 10 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.payout_mult, card.ability.extra.shop_mult, card.ability.extra.sold_mult } }
    end,

    add_to_deck = function(self, card, from_debuff)
        update_shop_prices()
    end,

    remove_from_deck = function(self, card, from_debuff)
        update_shop_prices()
    end,

    calculate = function(self, card, context)
        if context.selling_self and not context.blueprint then
            G.GAME.foolspara_inflation_sold_mult = (G.GAME.foolspara_inflation_sold_mult or 1) * card.ability.extra.sold_mult
            update_shop_prices()
        end
    end
}

if not SMODS.kranlaxs_inflation_hook then
    local orig_set_cost = Card.set_cost
    function Card:set_cost()
        orig_set_cost(self)
        if G.STAGE == G.STAGES.RUN and self.config and self.config.center and self.config.center.key ~= 'j_foolspara_free_money' then
            local active_count = count_active_inflation()
            local sold_mult = (G.GAME and G.GAME.foolspara_inflation_sold_mult) or 1
            local total_mult = (3 ^ active_count) * sold_mult

            if total_mult > 1 and self.cost and self.cost > 0 then
                self.cost = math.max(1, math.floor(self.cost * total_mult))
            end
        end
    end

    local orig_evaluate_round = G.FUNCS.evaluate_round
    G.FUNCS.evaluate_round = function()
        if G.GAME then
            G.GAME.foolspara_inflation_extra = 0
        end
        return orig_evaluate_round()
    end

    local orig_add_round_eval_row = add_round_eval_row
    function add_round_eval_row(config)
        if G.STAGE == G.STAGES.RUN and config then
            local active_count = count_active_inflation()
            if active_count > 0 then
                local mult = 2 ^ active_count
                if config.name == 'bottom' then
                    config.dollars = (config.dollars or 0) + (G.GAME.foolspara_inflation_extra or 0)
                    G.GAME.foolspara_inflation_extra = 0
                elseif config.dollars and config.dollars > 0 then
                    local new_dollars = config.dollars * mult
                    G.GAME.foolspara_inflation_extra = (G.GAME.foolspara_inflation_extra or 0) + (new_dollars - config.dollars)
                    config.dollars = new_dollars
                end
            end
        end
        return orig_add_round_eval_row(config)
    end

    SMODS.kranlaxs_inflation_hook = true
end