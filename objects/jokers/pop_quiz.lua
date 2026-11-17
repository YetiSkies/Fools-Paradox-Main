local function count_active_pop_quiz()
    if G.STAGE ~= G.STAGES.RUN or not G.jokers or not G.jokers.cards then
        return 0
    end
    local count = 0
    for _, j in ipairs(G.jokers.cards) do
        if j and j.config and j.config.center and j.config.center.key == 'j_foolspara_pop_quiz' and not j.debuff then
            count = count + 1
        end
    end
    return count
end

SMODS.Joker {
    key = 'pop_quiz',
    config = { extra = { x_mult = 2, reroll_mult = 2 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 8, y = 10 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, card.ability.extra.reroll_mult } }
    end,

    add_to_deck = function(self, card, from_debuff)
        if G.GAME and G.GAME.current_round and calculate_reroll_cost then
            calculate_reroll_cost(true)
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if G.GAME and G.GAME.current_round and calculate_reroll_cost then
            calculate_reroll_cost(true)
        end
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end
}

if not SMODS.kranlaxs_pop_quiz_hook then
    local orig_calc_reroll = calculate_reroll_cost
    function calculate_reroll_cost(skip_increment)
        orig_calc_reroll(skip_increment)
        local count = count_active_pop_quiz()
        if count > 0 and G.GAME and G.GAME.current_round and G.GAME.current_round.reroll_cost then
            G.GAME.current_round.reroll_cost = G.GAME.current_round.reroll_cost * (2 ^ count)
        end
    end
    SMODS.kranlaxs_pop_quiz_hook = true
end