SMODS.Joker {
    key = 'mastermind',
    config = { extra = { discards = 4, x_mult = 3 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 6, y = 5 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.discards, card.ability.extra.x_mult } }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_discard(card.ability.extra.discards)
                    
                    local hands_to_lose = G.GAME.current_round.hands_left - 1
                    if hands_to_lose ~= 0 then
                        ease_hands_played(-hands_to_lose)
                    end
                    
                    card:juice_up(0.5, 0.5)
                    return true
                end
            }))
        end

        if context.joker_main then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end
}