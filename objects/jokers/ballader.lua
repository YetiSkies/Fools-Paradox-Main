SMODS.Joker {
    key = 'balladeer',
    config = { extra = { h_size = 2, discards = 2 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 7, y = 11 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.h_size, card.ability.extra.discards } }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not (context.blueprint_card or card).getting_sliced then
            local amount = card.ability.extra.discards
            if amount > 0 then
                local target = context.blueprint_card or card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        ease_discard(amount)
                        card_eval_status_text(target, 'extra', nil, nil, nil, {
                            message = "+" .. amount .. " " .. localize('k_discard'),
                            colour = G.C.RED
                        })
                        return true
                    end
                }))
            end
        end
    end
}