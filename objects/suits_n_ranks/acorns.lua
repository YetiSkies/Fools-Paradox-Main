SMODS.Suit {
  key = 'Acorns',
  card_key = 'ACORNS',
  lc_atlas = 'parallelsuits_lc',
  lc_ui_atlas = 'suits_ui_lc',
  lc_colour = HEX("935920"),
  hc_atlas = 'parallelsuits_hc',
  hc_ui_atlas = 'suits_ui_hc',
  hc_colour = HEX("935920"),
  pos = { y = 3 },
  ui_pos = { x = 3, y = 0 },

  in_pool = function(self, args)
if args and args.initial_deck then
			-- local back = G.GAME.selected_back
			-- local back_config = back and back.effect.center.has_acorns
			-- if back_config then return true end
            return false
        end
		--if you have a base rank acorns, have it appear only 1 in 3 at a time.
		if FOOLSPARA.suit_in_deck('foolspara_Acorns') then
			--appears at X0.25 the rate of usual suits
			if pseudorandom(pseudoseed("parallel_spawn_rate")) < 0.1 then
				return true
			else
				return false
			end
		end
		return FOOLSPARA.spectrum_played() and pseudorandom(pseudoseed("parallel_spawn_rate")) < 0.1
	end
}

