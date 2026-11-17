SMODS.Joker {
    key = 'rna',
    config = { extra = { odds = 2 } },
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 1, y = 8 },

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
    end,

    calculate = function(self, card, context)
        if context.discard and G.GAME.current_round.discards_used == 0 and #context.full_hand == 1 then
            if pseudorandom('rna') < (G.GAME.probabilities.normal or 1) / card.ability.extra.odds then
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local new_card = copy_card(context.other_card, nil, nil, G.playing_card)
                local editions = {'foil', 'holo', 'polychrome'}
                local random_edition, _ = pseudorandom_element(editions, pseudoseed('rna_ed'))
                new_card:set_edition({ [random_edition] = true }, true)
                new_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, new_card)
                G.hand:emplace(new_card)
                new_card.states.visible = nil

                G.E_MANAGER:add_event(Event({
                    func = function()
                        new_card:start_materialize()
                        return true
                    end
                }))

                playing_card_joker_effects({ new_card })

                return {
                    message = localize('k_copied_ex'),
                    colour = G.C.CHIPS,
                    card = context.blueprint_card or card
                }
            end
        end
    end
}