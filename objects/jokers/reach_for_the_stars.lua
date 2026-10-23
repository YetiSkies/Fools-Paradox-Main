SMODS.Joker {
    key = 'reach_for_the_stars',
    config = { extra = { levels = 1, hands_to_revert = {} } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 7, y = 0 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.levels } }
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            local available_hands = {}
            for k, v in pairs(G.GAME.hands) do
                if v.visible then table.insert(available_hands, k) end
            end
            
            if #available_hands > 0 then
                local random_hand = pseudorandom_element(available_hands, pseudoseed('reach_stars_' .. G.GAME.round))
                
                card.ability.extra.hands_to_revert = card.ability.extra.hands_to_revert or {}
                table.insert(card.ability.extra.hands_to_revert, random_hand)
                
                level_up_hand(card, random_hand, false, card.ability.extra.levels)
                
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.RED
                }
            end
        end
        
        if context.end_of_round and not context.blueprint and not context.individual and not context.repetition then
            if card.ability.extra.hands_to_revert and #card.ability.extra.hands_to_revert > 0 then
                for _, hand in ipairs(card.ability.extra.hands_to_revert) do
                    level_up_hand(card, hand, true, -(card.ability.extra.levels))
                end
                card.ability.extra.hands_to_revert = {} 
            end
        end
    end
}