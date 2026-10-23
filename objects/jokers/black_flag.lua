SMODS.Joker {
    key = 'black_flag',
    config = { extra = { Xmult = 2 } },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 2, y = 0 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if G.GAME.current_round.discards_used == 0 then
                return {
                    message = localize{type='variable', key='a_xmult', vars={card.ability.extra.Xmult}},
                    Xmult_mod = card.ability.extra.Xmult
                }
            end
        end
    end
}