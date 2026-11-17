SMODS.Joker {
    key = 'revolution',
    config = { extra = { x_mult = 1, gain = 0.25 } },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 3, y = 12 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.gain, card.ability.extra.x_mult } }
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint and context.removed then
            local face_count = 0
            for _, removed_card in ipairs(context.removed) do
                if removed_card and removed_card:is_face() then
                    face_count = face_count + 1
                end
            end

            if face_count > 0 then
                card.ability.extra.x_mult = card.ability.extra.x_mult + (card.ability.extra.gain * face_count)
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
                    colour = G.C.MULT
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