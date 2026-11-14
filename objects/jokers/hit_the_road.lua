SMODS.Joker {
    key = 'hit_the_road',
    config = { extra = { x_mult_gain = 0.25, streak = 0 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 3, y = 5 },

    loc_vars = function(self, info_queue, card)
        local current_x = 1 + (card.ability.extra.streak * card.ability.extra.x_mult_gain)
        return { vars = { card.ability.extra.x_mult_gain, current_x } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local has_jack = false
            if context.scoring_hand then
                for _, c in ipairs(context.scoring_hand) do
                    if c:get_id() == 11 then 
                        has_jack = true
                        break
                    end
                end
            end

            if has_jack then
                card.ability.extra.streak = card.ability.extra.streak + 1
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
            else
                if card.ability.extra.streak > 0 then
                    card.ability.extra.streak = 0
                    return {
                        message = localize('k_reset'),
                        colour = G.C.RED
                    }
                end
            end
        end

        if context.joker_main then
            local final_x = 1 + (card.ability.extra.streak * card.ability.extra.x_mult_gain)
            if final_x > 1 then
                return {
                    x_mult = final_x
                }
            end
        end
    end
}