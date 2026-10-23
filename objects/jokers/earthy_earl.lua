SMODS.Joker {
    key = 'earthy_earl',
    config = { extra = { mult = 10 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 4, y = 1 }, 

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local has_valid_suit = false
            if context.scoring_hand then
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:is_suit('foolspara_Shields') or context.scoring_hand[i]:is_suit('foolspara_Acorns') then
                        has_valid_suit = true
                        break
                    end
                end
            end

            if has_valid_suit then
                return {
                    message = "+" .. card.ability.extra.mult .. " Mult",
                    mult_mod = card.ability.extra.mult,
                    colour = G.C.MULT
                }
            end
        end
    end
}