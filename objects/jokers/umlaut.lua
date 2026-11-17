SMODS.Joker {
    key = 'umlaut',
    config = { extra = {} },
    rarity = 4,
    cost = 20,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 5, y = 13 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.after and not context.blueprint and G.GAME.current_round.hands_left == 0 then
            local played_cards = context.full_hand or (G.play and G.play.cards)
            if played_cards then
                local targets = {}
                for _, c in ipairs(played_cards) do
                    if c and not c.edition then
                        targets[#targets + 1] = c
                    end
                end

                if #targets > 0 then
                    for _, c in ipairs(targets) do
                        local ed = poll_edition('umlaut', nil, false, true)
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.15,
                            func = function()
                                c:set_edition(ed, true)
                                c:juice_up(0.3, 0.3)
                                return true
                            end
                        }))
                    end
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.DARK_EDITION
                    }
                end
            end
        end
    end
}