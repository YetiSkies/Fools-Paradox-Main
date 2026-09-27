SMODS.PokerHandPart { -- Spectrum base (Referenced from SixSuits)
  key = 'spectrum',
  func = function(hand)
    if #hand < 5 then return {} end
    local unique_suits = FOOLSPARA.get_unique_suits(hand, nil, true)
    return (unique_suits >= 5) and { hand } or {}
  end
}    
    SMODS.PokerHand { -- Spectrum (Referenced from SixSuits)
    key = 'spectrum',
    visible = false,
    chips = 50,
    mult = 6,
    l_chips = 20,
    l_mult = 2,
    example = {
        { 'S_2',                true },
        { 'D_7',                true },
        { 'C_3',                true },
        { "foolspara_ROSES_A", true },
        { 'H_K',                true },
    },

    evaluate = function(parts)
        return parts.foolspara_spectrum
    end
    }
-- else
--     ---Override Bunco's implementation
--     if next(SMODS.find_mod("Bunco")) then
        
--     end
--     --Override paperback's implementation
--     if PB_UTIL and PB_UTIL.config.suits_enabled then
        
--     end
