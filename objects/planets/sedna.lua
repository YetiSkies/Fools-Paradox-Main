if SpectrumAPI then
	SpectrumAPI.add_content({
		priority = 1,
		object_type = "Planet",
		key = "foolspara_sedna",
		atlas = "consumables_atlas",
		pos = { x = 2, y = 0 },
		config = { hand_type = "spa_Spectrum_House", softlock = true },
		set_card_type_badge = function(self, card, badges)
			badges[1] = create_badge(localize("k_dwarf_planet"), get_type_colour(self or card.config, card), nil, 1.2)
		end,
		process_loc_text = function(self)
			local target_text = G.localization.descriptions[self.set]['c_mercury'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions[self.set][self.key] = {}
			G.localization.descriptions[self.set][self.key].text = target_text
		end,
		generate_ui = 0,
	}, {hand = "spa_Spectrum_House"})
else
	SMODS.Consumable{
		set = "Planet",
		key = "foolspara_sedna",
		atlas = "consumables_atlas",
		pos = { x = 2, y = 0 },
		config = { hand_type = "foolspara_spectrum_house", softlock = true },
		set_card_type_badge = function(self, card, badges)
			badges[1] = create_badge(localize("k_dwarf_planet"), get_type_colour(self or card.config, card), nil, 1.2)
		end,
		process_loc_text = function(self)
			local target_text = G.localization.descriptions[self.set]['c_mercury'].text
			SMODS.Consumable.process_loc_text(self)
			G.localization.descriptions[self.set][self.key] = {}
			G.localization.descriptions[self.set][self.key].text = target_text
		end,
		generate_ui = 0,
	}
end