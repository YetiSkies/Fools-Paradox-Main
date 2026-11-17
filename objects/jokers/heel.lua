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

local function count_active_heels()
    if G.STAGE ~= G.STAGES.RUN or not G.jokers or not G.jokers.cards then
        return 0
    end

    local count = 0
    for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]
        if j and not j.debuff and j.config and j.config.center then
            if j.config.center.key == 'j_foolspara_heel' then
                count = count + 1
            else
                local resolved = resolve_copied_joker(i)
                if resolved and resolved.config.center.key == 'j_foolspara_heel' then
                    count = count + 1
                end
            end
        end
    end
    return count
end

SMODS.Joker {
    key = 'heel',
    config = { extra = { x_mult = 2.5, blind_mult = 1.5 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 3, y = 9 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, card.ability.extra.blind_mult } }
    end,

    update = function(self, card, dt)
        if G.STAGE == G.STAGES.RUN and G.GAME and G.GAME.blind and G.GAME.blind.in_blind and G.GAME.blind.foolspara_heel_base_chips then
            local current_count = count_active_heels()
            if current_count ~= (G.GAME.blind.foolspara_heel_count or 0) then
                G.GAME.blind.foolspara_heel_count = current_count
                G.GAME.blind.chips = math.floor(G.GAME.blind.foolspara_heel_base_chips * (1.5 ^ current_count))
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            end
        end
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end
}

if not SMODS.kranlaxs_heel_hook then
    local orig_set_blind = Blind.set_blind
    function Blind:set_blind(blind, reset, silent)
        orig_set_blind(self, blind, reset, silent)

        if blind and not reset and self.chips then
            self.foolspara_heel_base_chips = self.chips
            local count = count_active_heels()
            self.foolspara_heel_count = count
            if count > 0 then
                self.chips = math.floor(self.foolspara_heel_base_chips * (1.5 ^ count))
                self.chip_text = number_format(self.chips)
            end
        end
    end
    SMODS.kranlaxs_heel_hook = true
end