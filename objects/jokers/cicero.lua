FOOLSPARA = FOOLSPARA or {}

local function get_active_cicero()
    if G.STAGE ~= G.STAGES.RUN or not G.jokers or not G.jokers.cards then
        return nil
    end
    for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]
        if j and j.config and j.config.center and j.config.center.key == 'j_foolspara_cicero' and not j.debuff then
            return j
        end
    end
    return nil
end

local function is_playing_card_pack_open()
    if G.STATE == G.STATES.STANDARD_PACK then
        return true
    end
    if SMODS and SMODS.OPENED_BOOSTER and SMODS.OPENED_BOOSTER.config and SMODS.OPENED_BOOSTER.config.center then
        local center = SMODS.OPENED_BOOSTER.config.center
        if center.kind == 'Standard' or center.foolspara_playing_card_pack then
            return true
        end
    end
    if G.pack_cards and G.pack_cards.cards and #G.pack_cards.cards > 0 then
        local first = G.pack_cards.cards[1]
        if first and first.ability and (first.ability.set == 'Default' or first.ability.set == 'Enhanced') then
            return true
        end
    end
    return false
end

local function is_consumable_creating()
    if not G.GAME then
        return false
    end
    return (G.GAME.foolspara_in_consumable or 0) > 0 and (G.GAME.foolspara_in_joker or 0) <= 0
end

local function is_valid_cicero_target(card, area)
    if not card or not area then
        return false
    end
    if G.STAGE ~= G.STAGES.RUN or G.OVERLAY_MENU then
        return false
    end
    if is_consumable_creating() then
        return false
    end
    if G.STATE == G.STATES.SHOP then
        return false
    end
    if area == G.shop_jokers or area == G.shop_vouchers or area == G.shop_booster then
        return false
    end
    if is_playing_card_pack_open() then
        return false
    end
    if area == G.pack_cards and card.ability and (card.ability.set == 'Default' or card.ability.set == 'Enhanced') then
        return false
    end

    return area == G.jokers
        or area == G.consumeables
        or area == G.hand
        or area == G.deck
        or area == G.play
        or area == G.pack_cards
end

SMODS.Joker {
    key = 'cicero',
    config = { extra = {} },
    rarity = 4,
    cost = 20,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 4, y = 13 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end
}

if not FOOLSPARA.cicero_hook then
    local orig_card_load = Card.load
    function Card:load(cardTable, other_card)
        if G.GAME then
            G.GAME.foolspara_loading_card = (G.GAME.foolspara_loading_card or 0) + 1
        end
        local res = orig_card_load(self, cardTable, other_card)
        if G.GAME then
            G.GAME.foolspara_loading_card = math.max(0, (G.GAME.foolspara_loading_card or 1) - 1)
        end
        return res
    end

    local orig_use_consumeable = Card.use_consumeable
    function Card:use_consumeable(area, copier)
        if G.GAME then
            G.GAME.foolspara_in_consumable = (G.GAME.foolspara_in_consumable or 0) + 1
        end
        local res = orig_use_consumeable(self, area, copier)
        if G.GAME then
            G.GAME.foolspara_in_consumable = math.max(0, (G.GAME.foolspara_in_consumable or 1) - 1)
        end
        return res
    end

    if SMODS.eval_card then
        local orig_eval_card = SMODS.eval_card
        function SMODS.eval_card(card, context)
            local is_joker = card and card.ability and card.ability.set == 'Joker'
            if is_joker and G.GAME then
                G.GAME.foolspara_in_joker = (G.GAME.foolspara_in_joker or 0) + 1
            end
            local ret, post = orig_eval_card(card, context)
            if is_joker and G.GAME then
                G.GAME.foolspara_in_joker = math.max(0, (G.GAME.foolspara_in_joker or 1) - 1)
            end
            return ret, post
        end
    end

    local orig_calc_joker = Card.calculate_joker
    function Card:calculate_joker(context)
        local is_joker = self and self.ability and self.ability.set == 'Joker'
        if is_joker and G.GAME then
            G.GAME.foolspara_in_joker = (G.GAME.foolspara_in_joker or 0) + 1
        end
        local res, trig = orig_calc_joker(self, context)
        if is_joker and G.GAME then
            G.GAME.foolspara_in_joker = math.max(0, (G.GAME.foolspara_in_joker or 1) - 1)
        end
        return res, trig
    end

    local orig_add_event = EventManager.add_event
    function EventManager:add_event(event, queue, front)
        if is_consumable_creating() and event and event.func and not event.foolspara_cicero_cons_wrapped then
            local orig_func = event.func
            event.foolspara_cicero_cons_wrapped = true
            event.func = function(...)
                if G.GAME then
                    G.GAME.foolspara_in_consumable = (G.GAME.foolspara_in_consumable or 0) + 1
                end
                local r1, r2, r3 = orig_func(...)
                if G.GAME then
                    G.GAME.foolspara_in_consumable = math.max(0, (G.GAME.foolspara_in_consumable or 1) - 1)
                end
                return r1, r2, r3
            end
        end
        return orig_add_event(self, event, queue, front)
    end

    local orig_card_init = Card.init
    function Card:init(X, Y, W, H, card, center, params)
        orig_card_init(self, X, Y, W, H, card, center, params)
        local is_loading = G.GAME and (G.GAME.foolspara_loading_card or 0) > 0
        local is_blank_placeholder = (card == G.P_CARDS.empty and center == G.P_CENTERS.c_base)
        if G.STAGE == G.STAGES.RUN and not G.OVERLAY_MENU and not is_loading and not is_blank_placeholder and not is_consumable_creating() then
            self.foolspara_new_card = true
        end
    end

    local orig_emplace = CardArea.emplace
    function CardArea:emplace(card, location, stay_flipped)
        orig_emplace(self, card, location, stay_flipped)

        if card and card.foolspara_new_card then
            card.foolspara_new_card = nil
            if not card.edition and card.set_edition and is_valid_cicero_target(card, self) then
                local cicero = get_active_cicero()
                if cicero then
                    local ed = poll_edition('cicero', nil, false, true)
                    if not ed then
                        local fallback = { 'e_foil', 'e_holo', 'e_polychrome', 'e_negative' }
                        ed = (pseudorandom_element(fallback, pseudoseed('cicero_fallback')))
                    end
                    if ed then
                        card:set_edition(ed, true)
                        cicero:juice_up(0.3, 0.3)
                    end
                end
            end
        end
    end

    FOOLSPARA.cicero_hook = true
end