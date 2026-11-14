SMODS.Joker {
    key = 'sneak_eyes',
    config = { extra = {} },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 2, y = 7 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.probabilities.normal = G.GAME.probabilities.normal / 2
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.probabilities.normal = G.GAME.probabilities.normal * 2
    end
}