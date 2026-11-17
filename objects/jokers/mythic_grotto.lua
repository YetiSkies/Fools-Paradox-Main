SMODS.Joker {
    key = 'mythic_grotto',
    config = { extra = {} },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 6, y = 7 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.after and not context.blueprint and context.scoring_hand then
            if FOOLSPARA and FOOLSPARA.rockcards and (not FOOLSPARA.rockgroup or #FOOLSPARA.rockgroup == 0) then
                FOOLSPARA.rockcards()
            end

            local card_protos = {}
            for _, v in pairs(G.P_CARDS) do
                card_protos[#card_protos + 1] = v
            end

            local changed_any = false
            for _, c in ipairs(context.scoring_hand) do
                local center_key = c.config and c.config.center and c.config.center.key or ''
                local is_rock = (FOOLSPARA and FOOLSPARA.rocks and FOOLSPARA.rocks[center_key]) or center_key == 'm_stone'

                if is_rock and #card_protos > 0 then
                    changed_any = true
                    local rock_pool = {}
                    if FOOLSPARA and FOOLSPARA.rockgroup then
                        for _, rk in ipairs(FOOLSPARA.rockgroup) do
                            if rk ~= center_key and G.P_CENTERS[rk] then
                                rock_pool[#rock_pool + 1] = rk
                            end
                        end
                    end
                    if #rock_pool == 0 then
                        rock_pool[1] = (FOOLSPARA and FOOLSPARA.rockgroup and #FOOLSPARA.rockgroup > 0) and FOOLSPARA.rockgroup[1] or 'm_stone'
                    end

                    local new_enh = (pseudorandom_element(rock_pool, pseudoseed('mythic_grotto_enh')))
                    local new_proto = (pseudorandom_element(card_protos, pseudoseed('mythic_grotto_base')))

                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            c:flip()
                            play_sound('card1', 1)
                            c:juice_up(0.3, 0.3)
                            return true
                        end
                    }))
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.1,
                        func = function()
                            c:set_base(new_proto)
                            c:set_ability(G.P_CENTERS[new_enh], nil, true)
                            return true
                        end
                    }))
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            c:flip()
                            play_sound('tarot2', 1, 0.6)
                            c:juice_up(0.3, 0.3)
                            return true
                        end
                    }))
                end
            end

            if changed_any then
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.ATTENTION
                }
            end
        end
    end
}