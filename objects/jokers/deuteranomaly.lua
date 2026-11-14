SMODS.Joker {
    key = 'deuteranomaly',
    config = { extra = {} },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 3, y = 4 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end
}

if not SMODS.kranlaxs_deuteranomaly_hook then
    local orig_update = Game.update
    function Game:update(dt)
        if orig_update then orig_update(self, dt) end
        
        local spec_key = FOOLSPARA and FOOLSPARA.spectrum_name or 'foolspara_spectrum'
        
        if SMODS.PokerHands and SMODS.PokerHands[spec_key] and not SMODS.PokerHands[spec_key].deuteranomaly_hooked then
            local orig_eval = SMODS.PokerHands[spec_key].evaluate
            
            SMODS.PokerHands[spec_key].evaluate = function(parts, hand)
                local ret = orig_eval(parts, hand)
                if ret and #ret > 0 then return ret end
                
                local has_deut = false
                if G.jokers and G.jokers.cards then
                    for _, j in ipairs(G.jokers.cards) do
                        if j.config.center.key == 'j_foolspara_deuteranomaly' and not j.debuff then
                            has_deut = true
                            break
                        end
                    end
                end

                if has_deut then
                    local suits = {}
                    local unique_suits = 0
                    for i = 1, #hand do
                        local s = hand[i].base.suit
                        if not suits[s] then
                            suits[s] = true
                            unique_suits = unique_suits + 1
                        end
                    end
                    if unique_suits >= 4 then
                        return {hand}
                    end
                end
                
                return {}
            end
            SMODS.PokerHands[spec_key].deuteranomaly_hooked = true
        end
    end
    SMODS.kranlaxs_deuteranomaly_hook = true
end