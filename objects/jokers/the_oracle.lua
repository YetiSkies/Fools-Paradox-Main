SMODS.Joker {
    key = 'the_oracle',
    config = { extra = {} },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 7, y = 10 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.discard and G.GAME.current_round.discards_used <= 0 and #context.full_hand == 1 then
            if context.other_card and context.other_card.config and context.other_card.config.center ~= G.P_CENTERS.c_base then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local c = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'the_oracle')
                            c:add_to_deck()
                            G.consumeables:emplace(c)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    return {
                        message = localize('k_plus_tarot'),
                        colour = G.C.SECONDARY_SET.Tarot,
                        card = context.blueprint_card or card,
                        remove = true
                    }
                end

                return {
                    remove = true
                }
            end
        end
    end
}