SMODS.Joker {
    key = 'anonymous_fool',
    config = { extra = { mult = 40, req = 3 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 3, y = 8 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.req } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.full_hand then
            local rankless_count = 0
            for _, c in ipairs(context.full_hand) do
                local is_rankless = (SMODS.has_no_rank and SMODS.has_no_rank(c)) or c.config.center.no_rank or c.ability.effect == 'Stone Card' or c:get_id() <= 0
                if is_rankless then
                    rankless_count = rankless_count + 1
                end
            end

            if rankless_count >= card.ability.extra.req then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}