SMODS.Joker {
    key = 'lima_bean',
    config = { extra = { hands = 7, loss = 1 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 7, y = 9 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hands, card.ability.extra.loss } }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not (context.blueprint_card or card).getting_sliced then
            local amount = card.ability.extra.hands
            if amount > 0 then
                local target = context.blueprint_card or card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        ease_hands_played(amount)
                        card_eval_status_text(target, 'extra', nil, nil, nil, {
                            message = localize { type = 'variable', key = 'a_hands', vars = { amount } },
                            colour = G.C.BLUE
                        })
                        return true
                    end
                }))
            end
        end

        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            if card.ability.extra.hands > 0 then
                card.ability.extra.hands = math.max(0, card.ability.extra.hands - card.ability.extra.loss)
                return {
                    message = "-" .. card.ability.extra.loss,
                    colour = G.C.BLUE
                }
            end
        end
    end
}