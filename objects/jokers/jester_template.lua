SMODS.Joker {
    key = 'jester_template',
    config = { extra = { mult = 40, current_mult = 0 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 2, y = 4 },

    loc_vars = function(self, info_queue, card)
        local count = 0
        if G.jokers and G.jokers.cards then
            for i = 1, #G.jokers.cards do
                local j = G.jokers.cards[i]
                if j and not j.getting_sliced and not j.removed then
                    count = count + 1
                end
            end
        end
        return { vars = { card.ability.extra.mult, count * card.ability.extra.mult } }
    end,

    update = function(self, card, dt)
        local count = 0
        if G.jokers and G.jokers.cards then
            for i = 1, #G.jokers.cards do
                local j = G.jokers.cards[i]
                if j and not j.getting_sliced and not j.removed then
                    count = count + 1
                end
            end
        end
        card.ability.extra.current_mult = count * card.ability.extra.mult
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local count = 0
            if G.jokers and G.jokers.cards then
                for i = 1, #G.jokers.cards do
                    local j = G.jokers.cards[i]
                    if j and not j.getting_sliced and not j.removed then
                        count = count + 1
                    end
                end
            end
            
            if count > 0 then
                return {
                    mult = count * card.ability.extra.mult
                }
            end
        end
    end
}