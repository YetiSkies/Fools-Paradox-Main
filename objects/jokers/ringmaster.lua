SMODS.Joker {
    key = 'ringmaster',
    config = { extra = { odds = 10 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 0, y = 12 },

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
    end,

    calculate = function(self, card, context)
        local target_joker = nil
        if context.selling_card and context.card and context.card.ability and context.card.ability.set == 'Joker' and context.card ~= card then
            context.card.foolspara_ringmaster_checked = true
            target_joker = context.card
        elseif context.foolspara_joker_destroyed and context.destroyed_joker and context.destroyed_joker ~= card then
            target_joker = context.destroyed_joker
        end

        if target_joker then
            if pseudorandom('ringmaster') < (G.GAME.probabilities.normal or 1) / card.ability.extra.odds then
                local ed = poll_edition('ringmaster_ed', nil, false, true)
                local is_neg = ed and ed.negative
                local effective_count = #G.jokers.cards - (target_joker.area == G.jokers and 1 or 0)

                if is_neg or (effective_count + G.GAME.joker_buffer < G.jokers.config.card_limit) then
                    local joker_key = target_joker.config.center.key
                    local target = context.blueprint_card or card
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local c = create_card('Joker', G.jokers, nil, nil, nil, nil, joker_key, 'ringmaster')
                            if ed then
                                c:set_edition(ed, true)
                            end
                            c:add_to_deck()
                            G.jokers:emplace(c)
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))

                    return {
                        message = localize('k_copied_ex'),
                        colour = G.C.DARK_EDITION,
                        card = target
                    }
                end
            end
        end
    end
}

if not SMODS.kranlaxs_ringmaster_hook then
    local orig_dissolve = Card.start_dissolve
    function Card:start_dissolve(color, silent, dissolve_time_fac, no_juice)
        if G.STAGE == G.STAGES.RUN and self.ability and self.ability.set == 'Joker' and self.area == G.jokers and not self.foolspara_ringmaster_checked then
            self.foolspara_ringmaster_checked = true
            SMODS.calculate_context({ foolspara_joker_destroyed = true, destroyed_joker = self })
        end
        if orig_dissolve then
            orig_dissolve(self, color, silent, dissolve_time_fac, no_juice)
        end
    end
    SMODS.kranlaxs_ringmaster_hook = true
end