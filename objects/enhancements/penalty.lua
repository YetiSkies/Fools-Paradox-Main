SMODS.Enhancement({
    key = 'penalty',
    pos = {x = 0, y = 0},
    atlas = 'Enhancers',
    config = { extra = {mult = 15, chips = 30} },
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult, card.ability.extra.chips} }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            SMODS.calculate_effect({mult_mod = card.ability.extra.mult, message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}}}, card)
            delay(0.2)
            SMODS.calculate_effect({chip_mod = -card.ability.extra.chips, message = localize{type='variable',key='a_chips_minus',vars={card.ability.extra.chips}}}, card)
        end
    end
})
