SMODS.Joker {
    key = 'pastel_pete',
    config = { extra = { mult = 10, chips = 20 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 2, y = 1 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local has_valid_suit = false
            if context.scoring_hand then
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:is_suit('foolspara_Bells') or context.scoring_hand[i]:is_suit('foolspara_Roses') then
                        has_valid_suit = true
                        break
                    end
                end
            end

            if has_valid_suit then
                SMODS.calculate_effect({
                    chip_mod = card.ability.extra.chips, 
                    message = localize{type='variable', key='a_chips', vars={card.ability.extra.chips}}
                }, card)
                
                return {
                    mult_mod = card.ability.extra.mult,
                    message = localize{type='variable', key='a_mult', vars={card.ability.extra.mult}}
                }
            end
        end
    end
}