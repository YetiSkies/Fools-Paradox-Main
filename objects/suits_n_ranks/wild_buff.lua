--wilds are now immune to debuffs


local debuffCard = Card.set_debuff
function Card:set_debuff(should_debuff)
    if ((SMODS.has_enhancement(self,'m_wild'))) then
        if self.debuff then
            self.debuff = false
            if self.area == G.jokers then self:add_to_deck(true) end
        end
        return
    else
        debuffCard(self,should_debuff)
    end
end

local debuffer = SMODS.debuff_card
function SMODS.debuff_card(card, debuff, source)
    if (SMODS.has_enhancement(card,'m_wild')) then
        if card.debuff then
            card.debuff = false
            if card.area == G.jokers then card:add_to_deck(true) end
        end
        return
    else
        debuffer(card,debuff,source)
    end
end