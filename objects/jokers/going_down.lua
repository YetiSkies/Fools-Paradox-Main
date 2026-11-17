SMODS.Joker {
    key = 'going_down',
    config = { extra = { x_mult = 2, loss = 5 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 1, y = 9 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, card.ability.extra.loss } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end
}

if not SMODS.kranlaxs_going_down_hook then
    local orig_ease_dollars = ease_dollars
    function ease_dollars(mod, instant)
        if G.STAGE == G.STAGES.RUN and mod and mod < 0 and not G.GAME.foolspara_going_down_lock and G.jokers and G.jokers.cards then
            local extra_loss = 0
            for _, j in ipairs(G.jokers.cards) do
                if j.config and j.config.center and j.config.center.key == 'j_foolspara_going_down' and not j.debuff then
                    extra_loss = extra_loss + (j.ability and j.ability.extra and j.ability.extra.loss or 5)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            j:juice_up(0.3, 0.3)
                            return true
                        end
                    }))
                end
            end

            if extra_loss > 0 then
                G.GAME.foolspara_going_down_lock = true
                orig_ease_dollars(mod - extra_loss, instant)
                G.GAME.foolspara_going_down_lock = false
                return
            end
        end
        return orig_ease_dollars(mod, instant)
    end
    SMODS.kranlaxs_going_down_hook = true
end