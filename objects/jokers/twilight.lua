SMODS.Joker {
    key = 'twilight',
    config = { extra = { repetitions = 1 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 6, y = 4 },

    loc_vars = function(self, info_queue, card) 
        return { vars = { card.ability.extra.repetitions } } 
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if G.GAME.current_round.hands_played > 0 and G.GAME.current_round.hands_left > 0 then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.repetitions,
                    card = card
                }
            end
        end
    end
}