SMODS.Joker {
    key = 'prosopagnosia',
    config = { extra = {} },
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 8, y = 7 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end
}

if not SMODS.kranlaxs_prosopagnosia_hook then
    local orig_is_face = Card.is_face
    function Card:is_face(from_boss)
        if next(SMODS.find_card('j_foolspara_prosopagnosia')) then
            return false
        end
        return orig_is_face(self, from_boss)
    end
    SMODS.kranlaxs_prosopagnosia_hook = true
end