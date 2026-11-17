local function resolve_copied_joker(start_idx)
    if not G.jokers or not G.jokers.cards then return nil end
    local visited = {}
    local idx = start_idx

    while idx and not visited[idx] do
        visited[idx] = true
        local curr = G.jokers.cards[idx]
        if not curr or curr.debuff or not curr.config or not curr.config.center then
            return nil
        end

        local key = curr.config.center.key
        if key == 'j_blueprint' or key == 'j_foolspara_fascimile' then
            idx = (key == 'j_blueprint') and (idx + 1) or (idx - 1)
        elseif key == 'j_brainstorm' then
            idx = 1
        else
            return curr
        end
    end

    return nil
end

local function count_active_morticians()
    if G.STAGE ~= G.STAGES.RUN or not G.jokers or not G.jokers.cards then
        return 0
    end

    local count = 0
    for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]
        if j and not j.debuff and j.config and j.config.center then
            if j.config.center.key == 'j_foolspara_mortician' then
                count = count + 1
            else
                local resolved = resolve_copied_joker(i)
                if resolved and resolved.config.center.key == 'j_foolspara_mortician' then
                    count = count + 1
                end
            end
        end
    end
    return count
end

SMODS.Joker {
    key = 'mortician',
    config = { extra = { blind_mult = 2 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 4, y = 11 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.blind_mult } }
    end,

    update = function(self, card, dt)
        if G.STAGE == G.STAGES.RUN and G.GAME and G.GAME.blind and G.GAME.blind.in_blind and G.GAME.blind.foolspara_mortician_count ~= nil then
            local current_count = count_active_morticians()
            local diff = current_count - G.GAME.blind.foolspara_mortician_count
            if diff ~= 0 then
                G.GAME.blind.foolspara_mortician_count = current_count
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * (2 ^ diff))
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            end
        end
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not (context.blueprint_card or card).getting_sliced then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                local target = context.blueprint_card or card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local c = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'mortician')
                        c:add_to_deck()
                        G.consumeables:emplace(c)
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
                card_eval_status_text(target, 'extra', nil, nil, nil, {
                    message = localize('k_plus_spectral'),
                    colour = G.C.SECONDARY_SET.Spectral
                })
            end
        end
    end
}

if not SMODS.kranlaxs_mortician_hook then
    local orig_set_blind = Blind.set_blind
    function Blind:set_blind(blind, reset, silent)
        orig_set_blind(self, blind, reset, silent)

        if blind and not reset and self.chips then
            local count = count_active_morticians()
            self.foolspara_mortician_count = count
            if count > 0 then
                self.chips = math.floor(self.chips * (2 ^ count))
                self.chip_text = number_format(self.chips)
            end
        end
    end
    SMODS.kranlaxs_mortician_hook = true
end