local function has_active_bedlam()
    if G.STAGE ~= G.STAGES.RUN or not G.jokers or not G.jokers.cards then
        return false
    end
    for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]
        if j and j.config and j.config.center and j.config.center.key == 'j_foolspara_bedlam' and not j.debuff then
            return true
        end
    end
    return false
end

local function is_consumable_card(c)
    if not c or not c.ability then
        return false
    end
    local set = c.ability.set
    if set == 'Joker' or set == 'Voucher' or set == 'Booster' or set == 'Default' or set == 'Enhanced' then
        return false
    end
    return c.ability.consumeable ~= nil or set == 'Tarot' or set == 'Planet' or set == 'Spectral'
end

local function count_consumables_in_area(area)
    local count = 0
    if area and area.cards then
        for _, c in ipairs(area.cards) do
            if is_consumable_card(c) then
                count = count + 1
            end
        end
    end
    return count
end

local function reward_bedlam_skipped(skipped)
    if skipped <= 0 or G.STAGE ~= G.STAGES.RUN or not G.jokers or not G.jokers.cards then
        return
    end
    for _, j in ipairs(G.jokers.cards) do
        if j and j.config and j.config.center and j.config.center.key == 'j_foolspara_bedlam' and not j.debuff then
            j.ability.extra.x_mult = j.ability.extra.x_mult + (j.ability.extra.gain * skipped)
            j:juice_up(0.5, 0.5)
            card_eval_status_text(j, 'extra', nil, nil, nil, {
                message = localize { type = 'variable', key = 'a_xmult', vars = { j.ability.extra.x_mult } },
                colour = G.C.MULT
            })
        end
    end
end

SMODS.Joker {
    key = 'bedlam',
    config = { extra = { x_mult = 1, gain = 0.1 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 6, y = 8 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.gain, card.ability.extra.x_mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.x_mult > 1 then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end
}

if not SMODS.kranlaxs_bedlam_hook then
    local orig_can_use = Card.can_use_consumeable
    function Card:can_use_consumeable(any_state, skip_check)
        if has_active_bedlam() then
            return false
        end
        return orig_can_use(self, any_state, skip_check)
    end

    local orig_skip_booster = G.FUNCS.skip_booster
    G.FUNCS.skip_booster = function(e)
        reward_bedlam_skipped(count_consumables_in_area(G.pack_cards))
        return orig_skip_booster(e)
    end

    local orig_reroll_shop = G.FUNCS.reroll_shop
    G.FUNCS.reroll_shop = function(e)
        reward_bedlam_skipped(count_consumables_in_area(G.shop_jokers))
        return orig_reroll_shop(e)
    end

    local orig_toggle_shop = G.FUNCS.toggle_shop
    G.FUNCS.toggle_shop = function(e)
        if G.STATE == G.STATES.SHOP then
            reward_bedlam_skipped(count_consumables_in_area(G.shop_jokers))
        end
        return orig_toggle_shop(e)
    end

    SMODS.kranlaxs_bedlam_hook = true
end