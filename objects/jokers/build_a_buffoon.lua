SMODS.Joker {
    key = 'build_a_buffoon',
    config = { extra = { rounds = 0, total_rounds = 4 } },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 5, y = 12 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.total_rounds, card.ability.extra.rounds } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            card.ability.extra.rounds = card.ability.extra.rounds + 1
            if card.ability.extra.rounds == card.ability.extra.total_rounds then
                local eval = function(c) return not c.REMOVED end
                juice_card_until(card, eval, true)
                return {
                    message = localize('k_active_ex'),
                    colour = G.C.FILTER
                }
            elseif card.ability.extra.rounds < card.ability.extra.total_rounds then
                return {
                    message = card.ability.extra.rounds .. '/' .. card.ability.extra.total_rounds,
                    colour = G.C.FILTER
                }
            end
        end

        if context.selling_self and not context.blueprint then
            if card.ability.extra.rounds >= card.ability.extra.total_rounds then
                local valid_jokers = {}
                local fallback_jokers = {}
                local has_showman = next(SMODS.find_card('j_ring_master'))

                for _, v in ipairs(G.P_CENTER_POOLS['Joker']) do
                    local r = v.rarity
                    local r_str = type(r) == 'string' and string.lower(r) or nil
                    local is_excluded = (
                        r == nil or
                        r == 1 or r_str == 'common' or
                        r == 2 or r_str == 'uncommon' or
                        r_str == 'foolspara_parallel' or r_str == 'parallel'
                    )

                    local pool_flag_ok = true
                    if v.no_pool_flag and G.GAME and G.GAME.pool_flags and G.GAME.pool_flags[v.no_pool_flag] then
                        pool_flag_ok = false
                    end
                    if v.yes_pool_flag and G.GAME and G.GAME.pool_flags and not G.GAME.pool_flags[v.yes_pool_flag] then
                        pool_flag_ok = false
                    end

                    if not is_excluded and v.unlocked and pool_flag_ok then
                        local allowed = true
                        if v.in_pool then
                            local ok, res = pcall(v.in_pool, v, { source = 'build_a_buffoon' })
                            if ok then
                                allowed = res
                            end
                        end

                        if allowed then
                            fallback_jokers[#fallback_jokers + 1] = v.key
                            if not (G.GAME and G.GAME.used_jokers and G.GAME.used_jokers[v.key]) or has_showman then
                                valid_jokers[#valid_jokers + 1] = v.key
                            end
                        end
                    end
                end

                local pool = (#valid_jokers > 0) and valid_jokers or fallback_jokers
                if #pool > 0 then
                    local chosen_key, _ = pseudorandom_element(pool, pseudoseed('build_a_buffoon'))
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local c = create_card('Joker', G.jokers, nil, nil, nil, nil, chosen_key, 'build_a_buffoon')
                            c:add_to_deck()
                            G.jokers:emplace(c)
                            return true
                        end
                    }))
                    return {
                        message = localize('k_plus_joker'),
                        colour = G.C.RARITY[3] or G.C.RED
                    }
                end
            end
        end
    end
}