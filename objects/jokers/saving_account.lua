SMODS.Joker {
    key = 'saving_account',
    config = { extra = { req = 12, dollars = 1, stored = 0 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 5, y = 7 },

    loc_vars = function(self, info_queue, card)
        local stored = card.ability.extra.stored or 0
        local payout = math.floor(stored / card.ability.extra.req) * card.ability.extra.dollars
        return { vars = { card.ability.extra.req, card.ability.extra.dollars, stored, payout } }
    end,

    calc_dollar_bonus = function(self, card)
        local stored = card.ability.extra.stored or 0
        local bonus = math.floor(stored / card.ability.extra.req) * card.ability.extra.dollars
        if bonus > 0 then
            return bonus
        end
    end
}

if not SMODS.kranlaxs_saving_account_hook then
    local orig_cash_out = G.FUNCS.cash_out
    G.FUNCS.cash_out = function(e)
        if G.GAME and G.GAME.current_round and G.GAME.current_round.dollars and G.GAME.current_round.dollars > 0 and G.jokers and G.jokers.cards then
            for _, j in ipairs(G.jokers.cards) do
                if j.config.center.key == 'j_foolspara_saving_account' and not j.debuff then
                    local taken = math.floor(G.GAME.current_round.dollars / 2)
                    if taken > 0 then
                        G.GAME.current_round.dollars = G.GAME.current_round.dollars - taken
                        j.ability.extra.stored = (j.ability.extra.stored or 0) + taken
                        j:juice_up(0.5, 0.5)
                        card_eval_status_text(j, 'extra', nil, nil, nil, {
                            message = "+$" .. taken,
                            colour = G.C.MONEY
                        })
                    end
                end
            end
        end
        return orig_cash_out(e)
    end
    SMODS.kranlaxs_saving_account_hook = true
end