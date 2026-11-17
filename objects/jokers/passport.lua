SMODS.Joker {
    key = 'passport',
    config = { extra = { x_mult = 4, req = 20 } },
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 9, y = 12 },

    loc_vars = function(self, info_queue, card)
        local sealed = 0
        if G.playing_cards then
            for _, c in ipairs(G.playing_cards) do
                if c.seal then
                    sealed = sealed + 1
                end
            end
        end
        return { vars = { card.ability.extra.x_mult, card.ability.extra.req, sealed } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local sealed = 0
            if G.playing_cards then
                for _, c in ipairs(G.playing_cards) do
                    if c.seal then
                        sealed = sealed + 1
                    end
                end
            end

            if sealed >= card.ability.extra.req then
                return {
                    x_mult = card.ability.extra.x_mult
                }
            end
        end
    end
}