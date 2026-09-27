--Greek Planets
-- Hermes
SMODS.Consumable {
    key = "hermes",
    set = "Planet",
    cost = 9,
    atlas = "consumables_atlas",
    pos = { x = 5, y = 3 },
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area)
        SMODS.upgrade_poker_hands({ hands = { "Pair" }, level_up = 3, from = card })
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_greek_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Aphrodite
SMODS.Consumable {
    key = "aphrodite",
    set = "Planet",
    cost = 9,
    atlas = "consumables_atlas",
    pos = { x = 3, y = 2 },

    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area)
        SMODS.upgrade_poker_hands({ hands = { "Three of a Kind" }, level_up = 3, from = card })
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_greek_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Gaia
SMODS.Consumable {
    key = "gaia",
    set = "Planet",
    cost = 9,
    atlas = "consumables_atlas",
    pos = { x = 2, y = 3 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"Full House"}, level_up = 3, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_greek_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Ares
SMODS.Consumable {
    key = "ares",
    set = "Planet",
    cost = 9,
    atlas = "consumables_atlas",
    pos = { x = 1, y = 2 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"Four of a Kind"}, level_up = 3, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_greek_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Zeus
SMODS.Consumable {
    key = "zeus",
    set = "Planet",
    cost = 9,
    atlas = "consumables_atlas",
    pos = { x = 0, y = 2 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"Flush"}, level_up = 3, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_greek_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Chronos
SMODS.Consumable {
    key = "chronos",
    set = "Planet",
    cost = 9,
    atlas = "consumables_atlas",
    pos = { x = 3, y = 3 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"Straight"}, level_up = 3, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_greek_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Caelus
SMODS.Consumable {
    key = "caelus",
    set = "Planet",
    cost = 9,
    atlas = "consumables_atlas",
    pos = { x = 5, y = 2 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"Two Pair"}, level_up = 3, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_greek_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Poseidon
SMODS.Consumable {
    key = "poseidon",
    set = "Planet",
    cost = 9,
    atlas = "consumables_atlas",
    pos = { x = 4, y = 2 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"Straight Flush"}, level_up = 3, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_greek_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Hades
SMODS.Consumable {
    key = "hades",
    set = "Planet",
    cost = 9,
    atlas = "consumables_atlas",
    pos = { x = 7, y = 2 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"High Card"}, level_up = 3, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_greek_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Nyx
SMODS.Consumable {
    key = "nyx",
    set = "Planet",
    cost = 9,
    atlas = "consumables_atlas",
    pos = { x = 6, y = 2 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"Five of a Kind"}, level_up = 3, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_greek_planet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Demeter
SMODS.Consumable {
    key = "demeter",
    set = "Planet",
    cost = 9,
    atlas = "consumables_atlas",
    pos = { x = 1, y = 3 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"Flush House"}, level_up = 3, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_greek_moon'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Discordia
SMODS.Consumable {
    key = "discordia",
    set = "Planet",
    cost = 9,
    atlas = "consumables_atlas",
    pos = { x = 6, y = 3 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"Flush Five"}, level_up = 3, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_greek_moon'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Hestia
SMODS.Consumable {
    key = "hestia",
    set = "Planet",
    cost = 9,
    atlas = "consumables_atlas",
    pos = { x = 8, y = 3 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"foolspara_null"}, level_up = 3, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_protoplanet'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Hera
SMODS.Consumable {
    key = "hera",
    set = "Planet",
    cost = 9,
    atlas = "consumables_atlas",
    pos = { x = 0, y = 3 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"foolspara_spectrum"}, level_up = 3, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_greek_moon'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Amphitrite
SMODS.Consumable {
    key = "amphitrite",
    set = "Planet",
    cost = 9,
    atlas = "consumables_atlas",
    pos = { x = 4, y = 3 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"foolspara_straight_spectrum"}, level_up = 3, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_greek_moon'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Aletheia
SMODS.Consumable {
    key = "aletheia",
    set = "Planet",
    cost = 9,
    atlas = "consumables_atlas",
    pos = { x = 2, y = 2 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"foolspara_spectrum_house"}, level_up = 3, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_greek_moon'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}

-- Persephone
SMODS.Consumable {
    key = "persephone",
    set = "Planet",
    cost = 9,
    atlas = "consumables_atlas",
    pos = { x = 7, y = 3 },
    can_use = function(self, card)
        return true
    end,
	use = function(self, card, area)
		SMODS.upgrade_poker_hands({hands = {"foolspara_spectrum_five"}, level_up = 3, from = card})
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_greek_moon'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}
