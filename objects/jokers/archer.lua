SMODS.Joker {
    key = 'archer',
    config = { extra = {} },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 2, y = 8 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint and context.scoring_hand then
            local enhanced_any = false
            local pool = {'m_bonus', 'm_foolspara_penalty'}

            for _, c in ipairs(context.scoring_hand) do
                if c.config.center == G.P_CENTERS.c_base and not c.debuff then
                    enhanced_any = true
                    local chosen_enh, _ = pseudorandom_element(pool, pseudoseed('archer'))
                    c:set_ability(G.P_CENTERS[chosen_enh], nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            c:juice_up()
                            return true
                        end
                    }))
                end
            end

            if enhanced_any then
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS
                }
            end
        end
    end
}