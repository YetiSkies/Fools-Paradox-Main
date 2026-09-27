SMODS.PokerHand({
	key = "null",
	visible = false,
	chips = 70,
	mult = 7,
	l_chips = 30,
	l_mult = 2,
	example = {
		{ "S_A", true, enhancement = "m_stone" },
		{ "S_A", true, enhancement = "m_stone" },
		{ "S_A", true, enhancement = "m_stone" },
		{ "S_A", true, enhancement = "m_stone" },
		{ "S_A", true, enhancement = "m_stone" },
	},
	evaluate = function(parts, hand)
      local _scoring = {}
      for _, card in ipairs(hand) do
        if SMODS.has_no_rank(card) then
          _scoring[#_scoring + 1] = card
        end
      end
      if #_scoring >= 5 then return { _scoring } end
    end
})