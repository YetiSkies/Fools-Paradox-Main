SMODS.Joker {
    key = 'nebula',
    config = { extra = {} },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 0, y = 8 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.scoring_name and G.GAME.hands[context.scoring_name] then
            local level = G.GAME.hands[context.scoring_name].level
            if level then
                return {
                    mult = level
                }
            end
        end
    end
}