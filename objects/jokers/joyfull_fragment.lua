SMODS.Joker {
    key = 'joyfull_fragment',
    config = { extra = {} },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 0, y = 4 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    in_pool = function(self, args)
        return true
    end,

    update = function(self, card, dt)
        if G.jokers and G.jokers.cards then
            local fragments = {}
            for _, j in ipairs(G.jokers.cards) do
                if j.config.center.key == 'j_foolspara_joyfull_fragment' and not j.getting_sliced then
                    table.insert(fragments, j)
                end
            end
            
            if #fragments >= 4 then
                for _, f in ipairs(fragments) do
                    f.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            f:start_dissolve()
                            return true
                        end
                    }))
                end
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local new_card = create_card('Joker', G.jokers, true, 4, nil, nil, 'j_foolspara_the_joyfull_one')
                        new_card:add_to_deck()
                        G.jokers:emplace(new_card)
                        return true
                    end
                }))
            end
        end
    end
}