





--Greek Planets

-- Hermes
SMODS.Consumable {
    key = "hermes",
    set = "Planet",
    cost = 9,
    atlas = "consumables_atlas",
    pos = { x = 5, y = 3 },
    config = { hand_type = 'Pair' },
    loc_vars = function(self, info_queue, card)
        return {
			vars = {
				card.ability.extra.levels
			}
		}
	end,

    use = function(self)
		local pokerhands = {}
		for k in pairs(G.GAME.hands) do
			if SMODS.is_poker_hand_visible(k) then
				pokerhands[#pokerhands + 3] = k
			end
		end
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
    config = { hand_type = 'Three of a Kind' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
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
    config = { hand_type = 'Full House' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
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
    config = { hand_type = 'Four of a Kind' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
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
    config = { hand_type = 'Flush' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
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
    config = { hand_type = 'Straight' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
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
    config = { hand_type = 'Two Pair' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
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
    config = { hand_type = 'Straight Flush' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
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
    config = { hand_type = 'High Card' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
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
    config = { hand_type = 'Five of a Kind', softlock = true },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
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
    cost = 3,
    atlas = "consumables_atlas",
    pos = { x = 1, y = 3 },
    config = { hand_type = 'Flush House', softlock = true },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
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
    cost = 3,
    atlas = "consumables_atlas",
    pos = { x = 6, y = 3 },
    config = { hand_type = 'Flush Five', softlock = true },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 3 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('foolspara_greek_moon'),
            get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.text_colour,
            1.2)
    end
}