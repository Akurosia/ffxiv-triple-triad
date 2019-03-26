module DecksHelper
  def purpose(deck)
    if deck.npc_id.present?
      link_to(deck.npc.name, npc_path(deck.npc))
    elsif deck.rule_id.present?
      deck.rule.name
    else
      'General'
    end
  end

  def usable?(deck, user_cards)
    missing = (deck.cards.pluck(:id) - user_cards).size

    if missing == 0
      fa_icon('check', data: { toggle: 'tooltip', title: 'You have all of the cards in this deck.' })
    else
      fa_icon('times', data: { toggle: 'tooltip',
                               title: "You are missing #{missing} #{'card'.pluralize(missing)} from this deck." })
    end
  end
end
