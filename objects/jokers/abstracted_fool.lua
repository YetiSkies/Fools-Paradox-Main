SMODS.Joker {
    key = 'abstracted_fool',
    config = { extra = { x_mult = 1, gain = 0.1 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 9, y = 4 },

    loc_vars = function(self, info_queue, card)
        local des = G.GAME and G.GAME.foolspara_cards_destroyed or 0
        return { vars = { card.ability.extra.gain, card.ability.extra.x_mult + (des * card.ability.extra.gain) } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local des = G.GAME and G.GAME.foolspara_cards_destroyed or 0
            local final_x = card.ability.extra.x_mult + (des * card.ability.extra.gain)
            if final_x > 1 then
                return {
                    x_mult = final_x
                }
            end
        end
    end
}

if not SMODS.kranlaxs_destroyed_tracker then
    local orig_dissolve = Card.start_dissolve
    function Card:start_dissolve(color, silent, dissolve_time_fac, no_juice)
        if G.STAGE == G.STAGES.RUN and self.playing_card and not self.abstracted_counted then
            if self.area and (self.area == G.hand or self.area == G.play or self.area == G.deck or self.area == G.discard) then
                self.abstracted_counted = true
                G.GAME.foolspara_cards_destroyed = (G.GAME.foolspara_cards_destroyed or 0) + 1
            end
        end
        if orig_dissolve then orig_dissolve(self, color, silent, dissolve_time_fac, no_juice) end
    end
    SMODS.kranlaxs_destroyed_tracker = true
end