SMODS.Joker {
    key = 'flower_boquete',
    config = { extra = { x_mult = 5 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 0, y = 7 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local has_rose = false
            local has_bell = false
            local has_acorn = false
            local has_shield = false
            
            if context.scoring_hand then
                for _, c in ipairs(context.scoring_hand) do
                    if c:is_suit('foolspara_Roses') then has_rose = true end
                    if c:is_suit('foolspara_Bells') then has_bell = true end
                    if c:is_suit('foolspara_Acorns') then has_acorn = true end
                    if c:is_suit('foolspara_Shields') then has_shield = true end
                end
            end

            if has_rose and has_bell and has_acorn and has_shield then
                return {
                    x_mult = card.ability.extra.x_mult
                }
            end
        end
    end
}