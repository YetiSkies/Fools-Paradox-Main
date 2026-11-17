local function has_active_diviner()
    if G.STAGE ~= G.STAGES.RUN or not G.jokers or not G.jokers.cards then
        return false
    end
    for _, j in ipairs(G.jokers.cards) do
        if j and j.config and j.config.center and j.config.center.key == 'j_foolspara_diviner' and not j.debuff then
            return true
        end
    end
    return false
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
    key = 'diviner',
    config = { extra = {} },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 1, y = 13 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    add_to_deck = function(self, card, from_debuff)
        update_shop_prices()
    end,

    remove_from_deck = function(self, card, from_debuff)
        update_shop_prices()
    end
}

if not SMODS.kranlaxs_diviner_hook then
    local orig_set_cost = Card.set_cost
    function Card:set_cost()
        orig_set_cost(self)
        if has_active_diviner() and self.ability then
            local is_tarot = self.ability.set == 'Tarot'
            local is_arcana_pack = self.ability.set == 'Booster' and self.config and self.config.center and self.config.center.kind == 'Arcana'
            if is_tarot or is_arcana_pack then
                self.cost = 0
            end
        end
    end
    SMODS.kranlaxs_diviner_hook = true
end