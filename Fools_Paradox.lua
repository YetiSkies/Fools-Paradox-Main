local mod_path = "" .. SMODS.current_mod.path
foolspara_config = SMODS.current_mod.config
FOOLSPARA = SMODS.current_mod


--Custom spectrum stuff
function FOOLSPARA.can_load_spectrums()
	if (not PB_UTIL or ( PB_UTIL and not PB_UTIL.config.suits_enabled))
	 and not next(SMODS.find_mod("Bunco"))
	  and not next(SMODS.find_mod("SixSuits")) 
	  and not (SMODS.Mods["SpectrumFramework"] or {}).can_load
	  then
		return true
	end
	return false
end

--load modded suits

FOOLSPARA.light_suits = { 'Diamonds', 'Hearts','foolspara_Roses', 'foolspara_Bells' }
FOOLSPARA.dark_suits = { 'Spades', 'Clubs','foolspara_Shields', 'foolspara_Acorns' }
FOOLSPARA.standard_suits ={'Spades', 'Hearts', 'Clubs','Diamonds' }
FOOLSPARA.parallel_suits ={'foolspara_roses', 'foolspara_Bells','foolspara_Shields','foolspara_Acorns'}

SMODS.Atlas {
  key = 'parallelsuits_lc',
  path = 'parallelsuits_lc.png',
  px = 71,
  py = 95,
}

SMODS.Atlas {
  key = 'suits_ui_lc',
  path = 'suits_ui_lc.png',
  px = 36,
  py = 18,
}

SMODS.Atlas {
  key = 'parallelsuits_hc',
  path = 'parallelsuits_hc.png',
  px = 71,
  py = 95,
}

SMODS.Atlas {
  key = 'suits_ui_hc',
  path = 'suits_ui_hc.png',
  px = 36,
  py = 18,
}
-- Suit and their Tarot
assert(SMODS.load_file('objects/suits_n_ranks/acorns.lua'))()
assert(SMODS.load_file('objects/suits_n_ranks/bells.lua'))()
assert(SMODS.load_file('objects/suits_n_ranks/roses.lua'))()
assert(SMODS.load_file('objects/suits_n_ranks/shields.lua'))()
assert(SMODS.load_file('objects/suits_n_ranks/suits_light_dark.lua'))()
assert(SMODS.load_file('objects/suits_n_ranks/suit_utils.lua'))()
assert(SMODS.load_file('objects/tarot/the_earth.lua'))()
assert(SMODS.load_file('objects/tarot/the_air.lua'))()
assert(SMODS.load_file('objects/tarot/the_fire.lua'))()
assert(SMODS.load_file('objects/tarot/the_water.lua'))()


--HANDS
SMODS.Atlas {
	key = "consumables_atlas",
	path = "consumables.png",
	px = 71,
	py = 95
}
if not (SMODS.Mods["Artbox"] or {}).can_load  then
	NFS.load(mod_path .. "objects/poker_hands/null.lua")()
	--planets
	NFS.load(mod_path .. "objects/planets/vesta.lua")()
end

FOOLSPARA.spectrum_name = 'foolspara_spectrum'
if SpectrumAPI then
	FOOLSPARA.spectrum_name = 'spa_Spectrum'
end
if FOOLSPARA.can_load_spectrums() then
	if not SpectrumAPI then
		NFS.load(mod_path .. "objects/poker_hands/spectrum.lua")()
		NFS.load(mod_path .. "objects/poker_hands/straight_spectrum.lua")()
		NFS.load(mod_path .. "objects/poker_hands/spectrum_house.lua")()
		NFS.load(mod_path .. "objects/poker_hands/spectrum_five.lua")()
	end

	--planets
	NFS.load(mod_path .. "objects/planets/quaoar.lua")()
	NFS.load(mod_path .. "objects/planets/haumea.lua")()
	NFS.load(mod_path .. "objects/planets/sedna.lua")()
	NFS.load(mod_path .. "objects/planets/makemake.lua")()
end
if next(SMODS.find_mod("Bunco")) then
	NFS.load(mod_path .. "objects/poker_hands/bunco_override.lua")()

end
if next(SMODS.find_mod("SixSuits")) then
	NFS.load(mod_path .. "objects/poker_hands/six_suits_override.lua")()
end
if next(SMODS.find_mod("SpectrumFramework")) then
	NFS.load(mod_path .. "objects/poker_hands/framework_override.lua")()
end
NFS.load(mod_path .. "objects/poker_hands/light_dark_spectrum.lua")()
assert(SMODS.load_file('objects/suits_n_ranks/wild_buff.lua'))()
assert(SMODS.load_file("objects/blinds.lua"))()
assert(SMODS.load_file("objects/planets/theoryplanets.lua"))()
assert(SMODS.load_file("objects/planets/greekplanets.lua"))()

