SMODS.Joker {
    key = 'wax_replica',
    config = { extra = {} },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 8, y = 8 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards and context.removed and #context.removed > 0 then
            local to_copy = {}
            for _, removed_card in ipairs(context.removed) do
                if removed_card and removed_card.playing_card then
                    to_copy[#to_copy + 1] = removed_card
                end
            end

            if #to_copy > 0 then
                local target = context.blueprint_card or card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local created_cards = {}
                        for _, removed_card in ipairs(to_copy) do
                            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                            local new_card = copy_card(removed_card, nil, nil, G.playing_card)
                            new_card.dissolve = nil
                            new_card.dissolve_colours = nil
                            new_card.getting_sliced = nil
                            new_card.destroyed = nil
                            new_card.shattered = nil
                            new_card.facing = 'back'
                            new_card.sprite_facing = 'back'

                            local seal = SMODS.poll_seal and SMODS.poll_seal({ guaranteed = true, type_key = 'wax_replica_seal' })
                            if not seal then
                                local seals = {'Gold', 'Red', 'Blue', 'Purple'}
                                seal = (pseudorandom_element(seals, pseudoseed('wax_replica_seal')))
                            end
                            new_card:set_seal(seal, true, true)

                            new_card:add_to_deck()
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            table.insert(G.playing_cards, new_card)
                            G.deck:emplace(new_card)
                            created_cards[#created_cards + 1] = new_card
                        end

                        if #created_cards > 0 then
                            playing_card_joker_effects(created_cards)
                        end
                        return true
                    end
                }))

                return {
                    message = localize('k_copied_ex'),
                    colour = G.C.CHIPS,
                    card = target
                }
            end
        end
    end
}