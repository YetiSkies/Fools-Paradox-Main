SMODS.Joker {
    key = 'dreidel',
    config = { extra = { random_ranks = {'2', '3', '4'} } },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 5, y = 4 },

    loc_vars = function(self, info_queue, card)
        local rr = card.ability.extra.random_ranks or {'2', '3', '4'}
        local r1 = rr[1] and localize(rr[1], 'ranks') or '?'
        local r2 = rr[2] and localize(rr[2], 'ranks') or '?'
        local r3 = rr[3] and localize(rr[3], 'ranks') or '?'

        local max_rank = nil
        local max_val = -1
        local min_rank = nil
        local min_val = 9999999

        local ranks_list = {'2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace'}
        for _, rank_val in ipairs(ranks_list) do
            local val = G.GAME and G.GAME.foolspara_rank_usage and G.GAME.foolspara_rank_usage[rank_val] or 0
            if val > max_val then max_val = val; max_rank = rank_val end
            if val < min_val then min_val = val; min_rank = rank_val end
        end

        local most_str = max_rank and localize(max_rank, 'ranks') or '?'
        local least_str = min_rank and localize(min_rank, 'ranks') or '?'

        return { vars = { r1, r2, r3, most_str, least_str } }
    end,

    set_ability = function(self, card, initial)
        if initial then
            local ranks = {'2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace'}
            card.ability.extra.random_ranks = {}
            for i = 1, 3 do
                local v1, v2 = pseudorandom_element(ranks, pseudoseed('dreidel_init'))
                card.ability.extra.random_ranks[i] = v1
            end
        end
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local ranks = {'2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace'}
            card.ability.extra.random_ranks = {}
            for i = 1, 3 do
                local v1, v2 = pseudorandom_element(ranks, pseudoseed('dreidel_blind'))
                card.ability.extra.random_ranks[i] = v1
            end
        end

        if context.individual and context.cardarea == G.play then
            local r = context.other_card.base.value
            local is_random = false
            for _, rr in ipairs(card.ability.extra.random_ranks) do 
                if r == rr then is_random = true break end 
            end

            local max_rank = nil
            local max_val = -1
            local min_rank = nil
            local min_val = 9999999
            
            local ranks_list = {'2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace'}
            for _, rank_val in ipairs(ranks_list) do
                local val = G.GAME.foolspara_rank_usage and G.GAME.foolspara_rank_usage[rank_val] or 0
                if val > max_val then max_val = val; max_rank = rank_val end
                if val < min_val then min_val = val; min_rank = rank_val end
            end

            if is_random or r == max_rank then
                if pseudorandom('dreidel_proc') < (G.GAME.probabilities.normal or 1) / 4 then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local rnd = pseudorandom('dreidel_type')
                            if rnd < 0.33 then
                                add_tag(Tag(get_next_tag_key('dreidel_tag')))
                                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                            else
                                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                    local pool = (rnd < 0.66) and 'Tarot' or 'Planet'
                                    local c = create_card(pool, G.consumeables, nil, nil, nil, nil, nil, 'dreidel')
                                    c:add_to_deck()
                                    G.consumeables:emplace(c)
                                    G.GAME.consumeable_buffer = 0
                                end
                            end
                            card:juice_up(0.5, 0.5)
                            return true
                        end
                    }))
                    return {
                        extra = {message = "Dreidel!", colour = G.C.PURPLE},
                        card = card
                    }
                end
            elseif r == min_rank then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local c = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'dreidel_spec')
                            c:add_to_deck()
                            G.consumeables:emplace(c)
                            G.GAME.consumeable_buffer = 0
                            card:juice_up(0.5, 0.5)
                            return true
                        end
                    }))
                    return {
                        extra = {message = "Spectral!", colour = G.C.SECONDARY_SET.Spectral},
                        card = card
                    }
                end
            end
        end
    end
}

if not SMODS.kranlaxs_dreidel_hook then
    local orig_eval = G.FUNCS.evaluate_play
    G.FUNCS.evaluate_play = function(e)
        G.GAME.foolspara_rank_usage = G.GAME.foolspara_rank_usage or {}
        if G.play and G.play.cards then
            for _, c in ipairs(G.play.cards) do
                if not c.debuff and c.base and c.base.value then
                    local r = c.base.value
                    G.GAME.foolspara_rank_usage[r] = (G.GAME.foolspara_rank_usage[r] or 0) + 1
                end
            end
        end
        orig_eval(e)
    end
    SMODS.kranlaxs_dreidel_hook = true
end