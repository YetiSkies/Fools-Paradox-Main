SMODS.Joker {
    key = 'loot_box',
    config = { extra = {} },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 4, y = 4 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and G.GAME.blind.boss and not context.individual and not context.repetition then
            G.GAME.foolspara_loot_box_packs = (G.GAME.foolspara_loot_box_packs or 0) + 1
            return {
                message = localize('k_booster'),
                colour = G.C.PURPLE,
                card = card
            }
        end
    end
}

if not SMODS.kranlaxs_loot_box_hook then
    local orig_evaluate_round = G.FUNCS.evaluate_round
    G.FUNCS.evaluate_round = function()
        if G.GAME and G.GAME.foolspara_loot_box_packs and G.GAME.foolspara_loot_box_packs > 0 then
            G.GAME.foolspara_loot_box_packs = G.GAME.foolspara_loot_box_packs - 1
            G.GAME.foolspara_in_loot_box = true
            G.GAME.foolspara_resume_eval = false

            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    G.FUNCS.draw_from_discard_to_deck()
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.1,
                        func = function()
                            local pack_center, _ = pseudorandom_element(G.P_CENTER_POOLS['Booster'], pseudoseed('loot_box'))
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
        if G.GAME and G.GAME.foolspara_in_loot_box then
            G.GAME.foolspara_in_loot_box = false
            G.GAME.foolspara_resume_eval = true
            G.GAME.PACK_INTERRUPT = G.STATES.ROUND_EVAL
        end
        return orig_end_consumeable(e, delayfac)
    end

    local orig_update_round_eval = Game.update_round_eval
    function Game:update_round_eval(dt)
        if G.GAME and G.GAME.foolspara_resume_eval then
            G.GAME.foolspara_resume_eval = false
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

    SMODS.kranlaxs_loot_box_hook = true
end