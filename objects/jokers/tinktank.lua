SMODS.Joker {
    key = 'tinktank',
    config = { extra = {} },
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 6, y = 12 },

    loc_vars = function(self, info_queue, card)
        if card.area and card.area == G.jokers then
            local other_joker = G.jokers.cards[#G.jokers.cards]
            local compatible = other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat
            local main_end = {
                {
                    n = G.UIT.C,
                    config = { align = "bm", minh = 0.4 },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = {
                                ref_table = card,
                                align = "m",
                                colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8),
                                r = 0.05,
                                padding = 0.06
                            },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ',
                                        colour = G.C.UI.TEXT_LIGHT,
                                        scale = 0.32 * 0.8
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return { vars = {}, main_end = main_end }
        end
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        local other_joker = G.jokers and G.jokers.cards and G.jokers.cards[#G.jokers.cards]
        if other_joker and other_joker ~= card and not other_joker.debuff then
            return SMODS.blueprint_effect(card, other_joker, context)
        end
    end
}