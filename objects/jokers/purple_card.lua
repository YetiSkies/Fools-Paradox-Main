SMODS.Joker {
    key = 'purple_card',
    config = { extra = { chips = 0, chip_gain = 2 } },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 1, y = 2 }, 

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chip_gain, card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint then
            if G.pack_cards and G.pack_cards.cards and #G.pack_cards.cards > 0 then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(0.5, 0.5)
                        return true
                    end
                }))
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.CHIPS})
            end
        end

        if context.joker_main then
            if card.ability.extra.chips > 0 then
                return {
                    message = "+" .. card.ability.extra.chips,
                    chips = card.ability.extra.chips,
                    colour = G.C.CHIPS
                }
            end
        end
    end
}