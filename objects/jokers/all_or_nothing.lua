SMODS.Joker {
    key = 'all_or_nothing',
    config = { extra = { odds = 2, repetitions = 1 } },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'JokersFool',
    pos = { x = 2, y = 11 },

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.repetitions } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.other_card and context.other_card.facing == 'back' then
            if context.cardarea == G.play then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.repetitions,
                    card = context.blueprint_card or card
                }
            elseif context.cardarea == G.hand and (next(context.card_effects[1]) or #context.card_effects > 1) then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.repetitions,
                    card = context.blueprint_card or card
                }
            end
        end

        if context.after and not context.blueprint then
            if context.full_hand then
                for _, c in ipairs(context.full_hand) do
                    if c then c.foolspara_aon_flipped = nil end
                end
            end
            if G.play and G.play.cards then
                for _, c in ipairs(G.play.cards) do
                    if c then c.foolspara_aon_flipped = nil end
                end
            end
        end

        if context.discard and not context.blueprint and context.other_card then
            context.other_card.foolspara_aon_flipped = nil
        end

        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            if G.playing_cards then
                for _, c in ipairs(G.playing_cards) do
                    if c then c.foolspara_aon_flipped = nil end
                end
            end
        end
    end
}

if not SMODS.kranlaxs_all_or_nothing_hook then
    local orig_stay_flipped = Blind.stay_flipped
    function Blind:stay_flipped(area, card)
        local base_flipped = orig_stay_flipped(self, area, card)

        if area == G.hand and G.STAGE == G.STAGES.RUN and G.jokers and G.jokers.cards then
            for _, j in ipairs(G.jokers.cards) do
                if j and j.config and j.config.center and j.config.center.key == 'j_foolspara_all_or_nothing' and not j.debuff then
                    if base_flipped then
                        if card then card.foolspara_aon_flipped = true end
                        return true
                    end
                    local odds = (j.ability and j.ability.extra and j.ability.extra.odds) or 2
                    if pseudorandom('all_or_nothing') < (G.GAME.probabilities.normal or 1) / odds then
                        if card then card.foolspara_aon_flipped = true end
                        return true
                    end
                    break
                end
            end
        end

        return base_flipped
    end

    local orig_flip = Card.flip
    function Card:flip()
        if self.foolspara_aon_flipped and self.facing == 'back' then
            return
        end
        return orig_flip(self)
    end

    SMODS.kranlaxs_all_or_nothing_hook = true
end