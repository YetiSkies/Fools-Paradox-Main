SMODS.Joker {
    key = 'free_parking',
    config = { extra = { dollars = 2 } },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 8, y = 2 }, 

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition then
            local face_count = 0
            if G.hand and G.hand.cards then
                for _, c in ipairs(G.hand.cards) do
                    if c:is_face() and not c.debuff then
                        face_count = face_count + 1
                    end
                end
            end

            if face_count > 0 then
                local total_dollars = face_count * card.ability.extra.dollars
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + total_dollars
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        ease_dollars(total_dollars)
                        card:juice_up(0.5, 0.5)
                        return true
                    end
                }))
                
                return {
                    message = "+$" .. total_dollars,
                    colour = G.C.MONEY
                }
            end
        end
    end
}