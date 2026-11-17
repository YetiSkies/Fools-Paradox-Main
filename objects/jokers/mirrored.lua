local function has_active_mirrored_fool()
    if G.STAGE ~= G.STAGES.RUN or not G.jokers or not G.jokers.cards then
        return false
    end
    for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]
        if j and j.config and j.config.center and j.config.center.key == 'j_foolspara_mirrored_fool' and not j.debuff then
            return true
        end
    end
    return false
end

SMODS.Joker {
    key = 'mirrored_fool',
    config = { extra = {} },
    rarity = 'foolspara_parallel',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 8, y = 11 },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end
}

if not SMODS.kranlaxs_mirrored_fool_hook then
    local parallel_to_standard = {
        foolspara_Roses = 'Hearts',
        foolspara_Shields = 'Spades',
        foolspara_Bells = 'Diamonds',
        foolspara_Acorns = 'Clubs'
    }

    local mirrored_guard = false
    local orig_is_suit = Card.is_suit
    function Card:is_suit(suit, bypass_debuff, flush_calc)
        local res = orig_is_suit(self, suit, bypass_debuff, flush_calc)
        if res then return true end

        if not mirrored_guard and self.area == G.play and parallel_to_standard[suit] and has_active_mirrored_fool() then
            mirrored_guard = true
            local mapped = orig_is_suit(self, parallel_to_standard[suit], bypass_debuff, flush_calc)
            mirrored_guard = false
            if mapped then return true end
        end

        return false
    end

    SMODS.kranlaxs_mirrored_fool_hook = true
end