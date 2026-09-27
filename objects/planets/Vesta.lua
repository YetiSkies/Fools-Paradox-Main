SMODS.Consumable {
  set = "Planet",
  key = "vesta",
  pos = { x = 4, y = 0 },
  atlas = "consumables_atlas",
  config = {
    hand_type = "foolspara_null",
    softlock = true
  },
  loc_vars = function(self, info_queue, center)
    return {
      vars = {
        G.GAME.hands["foolspara_null"].level,
        localize("foolspara_null"),
        G.GAME.hands["foolspara_null"].l_mult,
        G.GAME.hands["foolspara_null"].l_chips,
        colours = { (G.GAME.hands["foolspara_null"].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands["foolspara_null"].level)]) }
      }
    }
  end,
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize('foolspara_protoplanet'), get_type_colour(card.config.center, card),
      nil, 1.2)
  end
}
