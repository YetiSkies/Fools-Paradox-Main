SMODS.Joker {
    key = 'rodeo_clown',
    config = { extra = {} },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 4, y = 7 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    add_to_deck = function(self, card, from_debuff)
        if G.GAME and G.GAME.blind and G.GAME.blind.in_blind and not card.rodeo_applied then
            card.rodeo_applied = true
            G.GAME.blind.chips = G.GAME.blind.chips * 2
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            G.GAME.blind.dollars = (G.GAME.blind.dollars or 0) * 2
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if G.GAME and G.GAME.blind and G.GAME.blind.in_blind and card.rodeo_applied then
            card.rodeo_applied = false
            G.GAME.blind.chips = G.GAME.blind.chips / 2
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            G.GAME.blind.dollars = math.max(0, math.floor((G.GAME.blind.dollars or 0) / 2))
        end
    end
}

if not SMODS.kranlaxs_rodeo_clown_hook then
    local orig_set_blind = Blind.set_blind
    function Blind:set_blind(blind, reset, silent)
        orig_set_blind(self, blind, reset, silent)
        
        if blind and not reset and G.jokers and G.jokers.cards then
            local count = 0
            for _, j in ipairs(G.jokers.cards) do
                if j.config.center.key == 'j_foolspara_rodeo_clown' and not j.debuff then
                    j.rodeo_applied = true
                    count = count + 1
                end
            end
            
            if count > 0 and self.chips then
                self.chips = self.chips * (2 ^ count)
                self.chip_text = number_format(self.chips)
                self.dollars = (self.dollars or 0) * (2 ^ count)
            end
        end
    end
    SMODS.kranlaxs_rodeo_clown_hook = true
end