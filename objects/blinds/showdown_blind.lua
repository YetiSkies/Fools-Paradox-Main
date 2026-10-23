--Clever Club - 2-9 Are Debuffed - Tested and Working
SMODS.Blind({
    key = 'finalclub',
    atlas = 'foolspara_blinds',
    pos = { y = 28 },
    boss = { showdown = true },
    boss_colour = HEX('620072'),
    mult = 3,
    dollars = 10,
    calculate = function(self, blind, context)
        if context.debuff_card and (context.debuff_card:get_id() == 2 or context.debuff_card:get_id() == 3 or context.debuff_card:get_id() == 4 or context.debuff_card:get_id() == 5 or context.debuff_card:get_id() == 6 or context.debuff_card:get_id() == 7 or context.debuff_card:get_id() == 8 or context.debuff_card:get_id() == 9) then return { debuff = true } end
    end
})

--Wicked Wand - Played Hand must contain a 3 of a kind - Tested and Working
SMODS.Blind({
    key = 'finalwand',
    atlas = 'foolspara_blinds',
    pos = { y = 29 },
    boss = { showdown = true },
    boss_colour = HEX('620072'),
    mult = 3,
    dollars = 10,
    debuff_hand = function(self, cards, hand, handname, check)
        if next(hand["Three of a Kind"]) then
            return false
        end
        G.GAME.blind.triggered = true
        return true
    end,
})

--Shining Star - Large Blind, Large Payout - Tested and Working
SMODS.Blind({
    key = 'finalstar',
    atlas = 'foolspara_blinds',
    pos = { y = 30 },
    boss = { showdown = true },
    boss_colour = HEX('620072'),
    mult = 8,
    dollars = 16,
})

--Sapphire Spade - Large Blind, 1 in 2 scored cards are destroyed -- working
SMODS.Blind({
    key = 'finalspade',
    atlas = 'foolspara_blinds',
    pos = { y = 31 },
    boss = { showdown = true },
    boss_colour = HEX('620072'),
    mult = 3.2,
    dollars = 10,
    calculate = function(self, blind, context)
        if
            context.destroy_card
            and (context.cardarea == G.play or context.cardarea == "unscored")
            and not G.GAME.blind.disabled
            and pseudorandom("sapphirespade") < 0.5
        then
            return { remove = true }
        end
    end,
})

-- Brilliant Diamond - Jokers Rare and Aboved are Debuffed -- working
SMODS.Blind({
    key = 'finaldiamond',
    atlas = 'foolspara_blinds',
    pos = { y = 32 },
    boss = { showdown = true },
    boss_colour = HEX('620072'),
    mult = 3,
    dollars = 10,
    recalc_debuff = function(self, card, from_blind)
        if (card.area == G.jokers) and not G.GAME.blind.disabled and not ((card.config.center.rarity == 1) or (card.config.center.rarity == 2)) then
            return true
        end
        return false
    end,
    in_pool = function(self)
        if not G.jokers then return false end
        for i, j in pairs(G.jokers.cards) do
            if not ((j.config.center.rarity == 1) or (j.config.center.rarity == 2)) then
                return true
            end
        end
        return false
    end
})

--Hoarding Halberd -- Large Blind, convert all discards to hands
SMODS.Blind	{
    key = 'finalhalberd',
    boss = {showdown = true},
    boss_colour = HEX("ff7f50"),
    atlas = "showdown_blinds",
    pos = { x = 0, y = 0},
    dollars = 10,
    mult = 5,
    set_blind = function(self, reset, silent)
        if not reset then
            self.discards_sub = G.GAME.current_round.discards_left
            self.hands_sub = -G.GAME.current_round.discards_left
            ease_hands_played(-self.hands_sub)
            ease_discard(-self.discards_sub)
        end
    end,
    defeat = function(self)
        ease_hands_played(self.hands_sub)
        ease_discard(self.discards_sub)
    end,
    disable = function(self)
        if not G.GAME.blind.disabled then
            ease_hands_played(self.hands_sub)
            ease_discard(self.discards_sub)
        end
    end,
    discovered = true,
}
