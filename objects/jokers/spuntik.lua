SMODS.Joker {
    key = 'spuntik',
    config = { extra = { dollars = 20 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 7, y = 12 },

    loc_vars = function(self, info_queue, card)
        local unique_hands = 0
        if G.GAME and G.GAME.hands then
            for _, v in pairs(G.GAME.hands) do
                if v.played_this_round and v.played_this_round > 0 then
                    unique_hands = unique_hands + 1
                end
            end
        end
        return { vars = { card.ability.extra.dollars, unique_hands * card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition then
            local unique_hands = 0
            if G.GAME and G.GAME.hands then
                for _, v in pairs(G.GAME.hands) do
                    if v.played_this_round and v.played_this_round > 0 then
                        unique_hands = unique_hands + 1
                    end
                end
            end

            local total_dollars = unique_hands * card.ability.extra.dollars
            if total_dollars > 0 then
                return {
                    dollars = total_dollars
                }
            end
        end
    end
}