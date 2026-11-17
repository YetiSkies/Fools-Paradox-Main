SMODS.Joker {
    key = 'black_eyed_pea',
    config = { extra = { discards = 7, loss = 1 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 6, y = 9 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.discards, card.ability.extra.loss } }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not (context.blueprint_card or card).getting_sliced then
            local amount = card.ability.extra.discards
            if amount > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        ease_discard(amount)
                        return true
                    end
                }))
            end
        end

        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            if card.ability.extra.discards > 0 then
                card.ability.extra.discards = math.max(0, card.ability.extra.discards - card.ability.extra.loss)
                if card.ability.extra.discards <= 0 then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('tarot1')
                            card.T.r = -0.2
                            card:juice_up(0.3, 0.4)
                            card.states.drag.is = true
                            card.children.center.pinch.x = true
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.3,
                                blockable = false,
                                func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                    return true
                                end
                            }))
                            return true
                        end
                    }))
                    return {
                        message = localize('k_eaten_ex'),
                        colour = G.C.RED
                    }
                else
                    return {
                        message = "-" .. card.ability.extra.loss,
                        colour = G.C.RED
                    }
                end
            end
        end
    end
}