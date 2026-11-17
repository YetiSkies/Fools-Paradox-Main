SMODS.Joker {
    key = 'glaciation',
    config = { extra = { chips = 20 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 8, y = 9 },

    loc_vars = function(self, info_queue, card)
        local extra_cards = math.max(0, (G.playing_cards and #G.playing_cards or 52) - 52)
        return { vars = { card.ability.extra.chips, extra_cards * card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local extra_cards = math.max(0, (G.playing_cards and #G.playing_cards or 52) - 52)
            local total_chips = extra_cards * card.ability.extra.chips
            if total_chips > 0 then
                return {
                    chips = total_chips
                }
            end
        end
    end
}