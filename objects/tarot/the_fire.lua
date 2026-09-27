SMODS.Consumable {
    key = 'the_fire',
    set = 'Tarot',
    atlas = "consumables_atlas",
    pos = { x = 2, y = 4 },
    config = { max_highlighted = 3, suit_conv = 'foolspara_Roses' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,
}