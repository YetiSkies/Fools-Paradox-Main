SMODS.Joker {
    key = 'goldfinger',
    config = { extra = { dollars = 10, odds = 1000 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 0, y = 2 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
    end,

    in_pool = function(self, args)
        if not G.GAME.pool_flags.gros_michel_extinct then return false end
        if SMODS.showman and SMODS.showman('j_foolspara_' .. self.key) then return true end
        local areas_to_check = {G.jokers, G.shop_jokers, G.pack_cards}
        for _, area in ipairs(areas_to_check) do
            if area and area.cards then
                for _, v in ipairs(area.cards) do
                    if v.config and v.config.center and v.config.center.key == 'j_foolspara_' .. self.key then return false end
                end
            end
        end
        return true
    end,

    calc_dollar_bonus = function(self, card)
        if card.ability.extra.dollars > 0 then
            return card.ability.extra.dollars
        end
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and not context.individual and not context.repetition then
            if pseudorandom('goldfinger') < (G.GAME.probabilities.normal or 1) / card.ability.extra.odds then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.collide.can = false
                        card.states.drag.can = false
                        card:start_dissolve()
                        return true
                    end
                }))
                return { message = localize('k_extinct_ex') }
            end
        end
    end
}