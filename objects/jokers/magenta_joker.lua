SMODS.Joker {
    key = 'magenta_joker',
    config = { extra = { mult = 4 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 6, y = 5 },

    loc_vars = function(self, info_queue, card)
        local count = G.playing_cards and #G.playing_cards or 52
        local missing = math.max(0, 52 - count)
        return { vars = { card.ability.extra.mult, missing * card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local count = G.playing_cards and #G.playing_cards or 52
            local missing = math.max(0, 52 - count)
            if missing > 0 then
                local final_mult = missing * card.ability.extra.mult
                return {
                    message = "+" .. final_mult .. " Mult",
                    mult_mod = final_mult
                }
            end
        end
    end
}