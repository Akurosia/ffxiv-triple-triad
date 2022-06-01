json.user deck.user.username
json.(deck, :notes, :rating)
json.updated deck.updated?

if deck.npc_id.present?
  json.purpose do
    json.type 'NPC'
    json.name deck.npc.name
    json.url api_npc_url(deck.npc_id)
  end
elsif deck.rule_id.present?
  json.purpose do
    json.type 'Rule'
    json.name deck.rule.name
  end
else
  json.purpose do
    json.type 'General'
    json.name 'General'
  end
end

json.cards do
  json.partial! '/api/cards/card', collection: deck.cards, as: :card, skip_sources: true
end
