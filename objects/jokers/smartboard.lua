SMODS.Joker {
    key = 'smartboard',
    config = { extra = { x_mult = 3 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 7, y = 5 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local all_parallel = true
            local has_cards = false
            
            if context.scoring_hand then
                for _, c in ipairs(context.scoring_hand) do
                    has_cards = true
                    if not (c:is_suit('foolspara_Roses') or c:is_suit('foolspara_Bells') or c:is_suit('foolspara_Acorns') or c:is_suit('foolspara_Shields')) then
                        all_parallel = false
                        break
                    end
                end
            end
            
            if has_cards and all_parallel then
                return {
                    x_mult = card.ability.extra.x_mult
                }
            end
        end
    end
}