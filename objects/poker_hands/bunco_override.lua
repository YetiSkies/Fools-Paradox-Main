--Override of bunco's spectrum functionality cause
SMODS.PokerHand:take_ownership("bunc_Spectrum",{
    evaluate = function(parts)
        return parts.foolspara_spectrum
    end
 })

 SMODS.PokerHand:take_ownership("bunc_Spectrum House",{
    evaluate = function(parts)
        if #parts._3 < 1 or #parts._2 < 2 or not next(parts.foolspara_spectrum) then return {} end
        return { SMODS.merge_lists(parts._all_pairs, parts.foolspara_spectrum) }
    end
 })

  SMODS.PokerHand:take_ownership("bunc_Straight Spectrum",{
    evaluate = function(parts)
        if not next(parts.foolspara_spectrum) or not next(parts._straight) then return {} end
        return { SMODS.merge_lists(parts.foolspara_spectrum, parts._straight) }
    end,
 })

SMODS.PokerHand:take_ownership("bunc_Spectrum Five",{
   evaluate = function(parts)
    if not next(parts._5) or not next(parts.foolspara_spectrum) then return {} end
    return { SMODS.merge_lists(parts._5, parts.foolspara_spectrum) }
  end
 })

