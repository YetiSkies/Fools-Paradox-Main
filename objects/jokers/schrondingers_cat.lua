SMODS.Joker {
    key = 'schrondingers_cat',
    config = { extra = { odds = 3 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 2, y = 6 },

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
    end
}

if not SMODS.kranlaxs_schrodinger_hook then
    local orig_dissolve = Card.start_dissolve
    function Card:start_dissolve(color, silent, dissolve_time_fac, no_juice)
        if G.STAGE == G.STAGES.RUN and self.playing_card and not self.schrodinger_processed then
            if self.area and (self.area == G.hand or self.area == G.play or self.area == G.deck or self.area == G.discard) then
                self.schrodinger_processed = true
                
                if G.jokers and G.jokers.cards then
                    for _, j in ipairs(G.jokers.cards) do
                        if j.config.center.key == 'j_foolspara_schrondingers_cat' and not j.debuff then
                            if pseudorandom('schrodinger') < (G.GAME.probabilities.normal or 1) / j.ability.extra.odds then
                                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                                local new_card = copy_card(self, nil, nil, G.playing_card)
                                new_card.getting_sliced = nil
                                new_card.destroyed = nil
                                new_card.shattered = nil
                                new_card.schrodinger_processed = nil
                                new_card:add_to_deck()
                                G.deck.config.card_limit = G.deck.config.card_limit + 1
                                table.insert(G.playing_cards, new_card)
                                G.deck:emplace(new_card)

                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        j:juice_up(0.5, 0.5)
                                        card_eval_status_text(j, 'extra', nil, nil, nil, {message = "Meow!", colour = G.C.GREEN})
                                        return true
                                    end
                                }))
                            end
                        end
                    end
                end
            end
        end
        if orig_dissolve then orig_dissolve(self, color, silent, dissolve_time_fac, no_juice) end
    end
    SMODS.kranlaxs_schrodinger_hook = true
end