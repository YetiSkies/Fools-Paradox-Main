local function get_horatio_pack_center(pack_type)
    local pool = {}
    if G.P_CENTER_POOLS and G.P_CENTER_POOLS['Booster'] then
        for _, v in ipairs(G.P_CENTER_POOLS['Booster']) do
            if pack_type == 'celestial' and (v.kind == 'Celestial' or string.find(v.key, 'p_celestial')) then
                pool[#pool + 1] = v
            elseif pack_type == 'pantheon' and (v.kind == 'Pantheon' or string.find(v.key, 'pantheon')) then
                pool[#pool + 1] = v
            end
        end
    end

    if #pool > 0 then
        local chosen, _ = pseudorandom_element(pool, pseudoseed('horatio_' .. pack_type))
        return chosen
    end

    if pack_type == 'pantheon' then
        return G.P_CENTERS['p_foolspara_pantheon_normal'] or G.P_CENTERS['p_celestial_normal_1']
    end
    return G.P_CENTERS['p_celestial_normal_1']
end

SMODS.Joker {
    key = 'horatio',
    config = { extra = {} },
    rarity = 4,
    cost = 20,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 6, y = 13 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint and G.GAME.blind then
            local blind_type = G.GAME.blind:get_type()
            if blind_type == 'Big' then
                G.GAME.foolspara_horatio_packs = G.GAME.foolspara_horatio_packs or {}
                G.GAME.foolspara_horatio_packs[#G.GAME.foolspara_horatio_packs + 1] = 'celestial'
                return {
                    message = localize('k_booster'),
                    colour = G.C.SECONDARY_SET.Planet,
                    card = card
                }
            elseif G.GAME.blind.boss or blind_type == 'Boss' then
                G.GAME.foolspara_horatio_packs = G.GAME.foolspara_horatio_packs or {}
                G.GAME.foolspara_horatio_packs[#G.GAME.foolspara_horatio_packs + 1] = 'pantheon'
                return {
                    message = localize('k_booster'),
                    colour = G.C.SECONDARY_SET.Spectral,
                    card = card
                }
            end
        end
    end
}

if not SMODS.kranlaxs_horatio_hook then
    local orig_evaluate_round = G.FUNCS.evaluate_round
    G.FUNCS.evaluate_round = function()
        if G.GAME and G.GAME.foolspara_horatio_packs and #G.GAME.foolspara_horatio_packs > 0 then
            local pack_type = table.remove(G.GAME.foolspara_horatio_packs, 1)
            G.GAME.foolspara_in_horatio_pack = true
            G.GAME.foolspara_horatio_resume_eval = false

            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    G.FUNCS.draw_from_discard_to_deck()
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.1,
                        func = function()
                            local pack_center = get_horatio_pack_center(pack_type)
                            local pack_card = Card(
                                G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
                                G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
                                G.CARD_W * 1.27,
                                G.CARD_H * 1.27,
                                G.P_CARDS.empty,
                                pack_center,
                                { bypass_discovery_center = true, bypass_discovery_ui = true }
                            )
                            pack_card.cost = 0
                            pack_card.from_tag = true
                            G.FUNCS.use_card({ config = { ref_table = pack_card } })
                            pack_card:start_materialize()
                            G.GAME.PACK_INTERRUPT = G.STATES.ROUND_EVAL
                            return true
                        end
                    }))
                    return true
                end
            }))
            return
        end
        return orig_evaluate_round()
    end

    local orig_end_consumeable = G.FUNCS.end_consumeable
    G.FUNCS.end_consumeable = function(e, delayfac)
        if G.GAME and G.GAME.foolspara_in_horatio_pack then
            G.GAME.foolspara_in_horatio_pack = false
            G.GAME.foolspara_horatio_resume_eval = true
            G.GAME.PACK_INTERRUPT = G.STATES.ROUND_EVAL
        end
        return orig_end_consumeable(e, delayfac)
    end

    local orig_update_round_eval = Game.update_round_eval
    function Game:update_round_eval(dt)
        if G.GAME and G.GAME.foolspara_horatio_resume_eval then
            G.GAME.foolspara_horatio_resume_eval = false
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.3,
                blocking = false,
                func = function()
                    G.FUNCS.evaluate_round()
                    return true
                end
            }))
        end
        return orig_update_round_eval(self, dt)
    end

    SMODS.kranlaxs_horatio_hook = true
end