SMODS.Joker {
    key = 'lush',
    config = { extra = { discards = 2, h_size = 1 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 4, y = 10 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.discards, card.ability.extra.h_size } }
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