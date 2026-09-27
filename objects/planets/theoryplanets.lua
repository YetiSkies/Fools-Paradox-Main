--Theoretical Planets

-- Vulcan
SMODS.Consumable {
    key = "vulcan",
    set = "Planet",
    cost = 6,
    atlas = "consumables_atlas",
    pos = { x = 0, y = 1 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"Flush", "Straight Flush", "Flush House", "Flush Five" }, level_up = 1, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_theory_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Tyche
SMODS.Consumable {
    key = "tyche",
    set = "Planet",
    cost = 6,
    atlas = "consumables_atlas",
    pos = { x = 1, y = 1 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"foolspara_spectrum", "foolspara_straight_spectrum", "foolspara_spectrum_house", "foolspara_spectrum_five" }, level_up = 1, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_theory_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Theia
SMODS.Consumable {
    key = "theia",
    set = "Planet",
    cost = 6,
    atlas = "consumables_atlas",
    pos = { x = 2, y = 1 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"Full House", "foolspara_spectrum_house", "Flush House" }, level_up = 1, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_theory_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Oceanus
SMODS.Consumable {
    key = "oceanus",
    set = "Planet",
    cost = 6,
    atlas = "consumables_atlas",
    pos = { x = 3, y = 1 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"Straight", "foolspara_straight_spectrum", "Straight Flush"}, level_up = 1, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_theory_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Bellona
SMODS.Consumable {
    key = "bellona",
    set = "Planet",
    cost = 6,
    atlas = "consumables_atlas",
    pos = { x = 4, y = 1 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"Three of a Kind", "Four of a Kind", "Five of a Kind", "foolspara_spectrum_five", "Flush Five" }, level_up = 1, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_theory_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Enyo
SMODS.Consumable {
    key = "enyo",
    set = "Planet",
    cost = 6,
    atlas = "consumables_atlas",
    pos = { x = 5, y = 1 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"High Card", "Pair", "Two Pair", "foolspara_null" }, level_up = 1, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_theory_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}