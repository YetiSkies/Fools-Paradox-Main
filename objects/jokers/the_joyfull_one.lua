SMODS.Joker {
    key = 'the_joyfull_one',
    config = { extra = { x_mult = 4 } },
    rarity = 4,
    cost = 20,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 1, y = 4 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end
}

if not SMODS.kranlaxs_joyfull_one_hook then
    local orig_set_debuff = Card.set_debuff
    function Card:set_debuff(should_debuff)
        if self.config and self.config.center and self.config.center.key == 'j_foolspara_the_joyfull_one' then
            should_debuff = false
        end
        if orig_set_debuff then orig_set_debuff(self, should_debuff) end
    end
    SMODS.kranlaxs_joyfull_one_hook = true
end