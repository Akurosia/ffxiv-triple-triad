puts 'Deleting existing decks'

Deck.destroy_all

puts 'Creating random decks'

users = User.where(public_cards: true)
low_tier_cards = Card.where(stars: (1..3)).pluck(:id)
high_tier_cards = Card.where(stars: (4..5)).pluck(:id)
rules = Rule.pluck(:id)
npcs = NPC.pluck(:id)

100.times do
  params = { card_ids: low_tier_cards.sample(4) << high_tier_cards.sample }

  case(rand(3))
  when 0
    params[:rule_id] = rules.sample
  when 1
    params[:npc_id] = npcs.sample
  end

  deck_user = users.sample
  deck = deck_user.decks.create!(params)

  users.reject { |user| user.id == deck_user.id }.sample(rand(5)).each do |user|
    deck.votes.create!(user: user)
  end
end
