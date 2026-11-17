local function is_rock_card(c)
    if not c or not c.config or not c.config.center then return false end
    if FOOLSPARA and FOOLSPARA.rockcards and not FOOLSPARA.rocks then
        FOOLSPARA.rockcards()
    end
    local key = c.config.center.key
    if FOOLSPARA and FOOLSPARA.rocks and FOOLSPARA.rocks[key] then
        return true
    end
    return c.config.center.foolspara_rock == true or key == 'm_stone'
end

SMODS.Joker {
    key = 'miner',
    config = { extra = { x_mult = 1, gain = 0.1 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 7, y = 8 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.gain, card.ability.extra.x_mult } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint and context.scoring_hand then
            local rock_count = 0
            for _, c in ipairs(context.scoring_hand) do
                if is_rock_card(c) and not c.debuff then
                    rock_count = rock_count + 1
                end
            end

            if rock_count > 0 then
                card.ability.extra.x_mult = card.ability.extra.x_mult + (card.ability.extra.gain * rock_count)
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
                    colour = G.C.MULT
                }
            end
        end

        if context.destroying_card and not context.blueprint and context.cardarea == G.play then
            if is_rock_card(context.destroying_card) and not context.destroying_card.debuff then
                return {
                    remove = true
                }
            end
        end

        if context.joker_main and card.ability.extra.x_mult > 1 then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end
}