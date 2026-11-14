SMODS.Joker {
    key = 'white_whale',
    config = { extra = {} },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 6, y = 6 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            local valid_cards = {}
            if G.playing_cards then
                for _, c in ipairs(G.playing_cards) do
                    if not c.edition then
                        table.insert(valid_cards, c)
                    end
                end
            end

            if #valid_cards > 0 then
                local target_card = pseudorandom_element(valid_cards, pseudoseed('white_whale'))
                local editions = {'foil', 'holo', 'polychrome'}
                local random_edition = pseudorandom_element(editions, pseudoseed('white_whale_ed'))

                G.E_MANAGER:add_event(Event({
                    func = function()
                        target_card:set_edition({[random_edition] = true}, true, true)
                        card:juice_up(0.5, 0.5)
                        return true
                    end
                }))
                
                return {
                    message = "Edition!",
                    colour = G.C.DARK_EDITION
                }
            end
        end
    end
}