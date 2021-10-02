require 'xiv_data'

namespace :npcs do
  desc 'Create the NPCs'
  task create: :environment do
    puts 'Creating NPCs'
    counts = { npc: NPC.count, npc_card: NPCCard.count, npc_reward: NPCReward.count,
               locations: Location.count }

    # Find all of the Triple Triad NPC Residents and create the base NPC object
    puts '  Fetching resident data'
    npcs = XIVData.sheet('ENpcBase').each_with_object({}) do |npc, h|
      npc.each do |k, v|
        if k&.match?('ENpcData') && v&.match(/TripleTriad#(\d+)/) && h.values.find { |val| val[:id] == $1.to_i }.nil?
          h[npc['#']] = { id: $1.to_i, resident_id: npc['#'].to_i }
          break
        end
      end
    end

    %w(en fr de ja).each do |locale|
      XIVData.sheet('ENpcResident', locale: locale).each do |npc|
        if npcs.has_key?(npc['#'])
          npcs[npc['#']]["name_#{locale}"] = sanitize_name(npc['Singular'])
        end
      end
    end

    # Find the associated Level data for each NPC Resident and add the location data
    puts '  Fetching location coordinate data'
    XIVData.sheet('Level', raw: true).each do |level|
      if npcs.has_key?(level['Object'])
        npcs[level['Object']].merge!(x: level['X'].to_f, y: level['Z'].to_f, map_id: level['Map'])
      end
    end

    map_ids = npcs.values.pluck(:map_id).uniq

    # Look up the relevant maps and set the coordinate data
    maps = XIVData.sheet('Map', raw: true).each_with_object({}) do |map, h|
      if map_ids.include?(map['#'])
        h[map['#']] = { region_id: map['PlaceName{Region}'].to_i, location_id: map['PlaceName'].to_i,
                        x_offset: map['Offset{X}'].to_f, y_offset: map['Offset{Y}'].to_f, size_factor: map['SizeFactor'].to_f }
      end
    end

    npcs.each do |id, npc|
      if map = maps[npc.delete(:map_id)]
        npc[:location_id] = map[:location_id]
        npc[:x] = get_coordinate(npc[:x], map[:x_offset], map[:size_factor])
        npc[:y] = get_coordinate(npc[:y], map[:y_offset], map[:size_factor])
      else
        # Skip and delete weird duplicate Battlehall NPCs with nil locations
        npcs.delete(id)
        next
      end
    end

    # Create the NPC locations
    puts '  Fetching location name data'
    locations = %w(en fr de ja).each_with_object(Hash.new({})) do |locale, h|
      places = XIVData.sheet('PlaceName', locale: locale, drop_zero: false).map { |place| place['Name']}
      maps.values.each do |map|
        h[map[:location_id]] = h[map[:location_id]].merge("name_#{locale}" => places[map[:location_id]],
                                                          "region_#{locale}" => places[map[:region_id]])
      end
    end

    locations.each do |id, data|
      Location.find_or_create_by!(data.merge(id: id))
    end

    # Add their opponent data
    puts '  Fetching opponent data'
    XIVData.sheet('TripleTriad').each do |opponent|
      npc = npcs.values.find { |val| val[:id] == opponent['#'].to_i }
      next unless npc.present?

      npc[:rewards] = opponent.each_with_object([]) do |(k, v), a|
        if k.match?('Item{PossibleReward}') && v.present?
          a << Card.where('BINARY name_en like ?', "%#{v.sub(/ Card$/, '')}%").first.id
        end
      end
    end

    XIVData.sheet('TripleTriad', raw: true).each do |opponent|
      npc = npcs.values.find { |val| val[:id] == opponent['#'].to_i }
      next unless npc.present?

      npc[:fixed_cards] = []
      npc[:variable_cards] = []
      npc[:rules] = []

      opponent.each do |k, v|
        if k.match?('PreviousQuest\[') && v != '0'
          npc[:quest_id] = v.to_i
        elsif k.match?('TripleTriadCard{Fixed}') && v != '0'
          npc[:fixed_cards] << v
        elsif k.match?('TripleTriadCard{Variable}') && v != '0'
          npc[:variable_cards] << v
        elsif k.match?('TripleTriadRule') && v != '0'
          npc[:rules] << Rule.find_by(id: v)
        end
      end
    end

    # Create the NPCs and their cards
    npcs.values.each do |data|
      fixed_cards = data.delete(:fixed_cards)
      variable_cards = data.delete(:variable_cards)
      rewards = data.delete(:rewards)

      # Create or update the NPC
      if npc = NPC.find_by(id: data[:id])
        data.except!('name_en', 'name_de', 'name_fr', 'name_ja', :quest_id, :rules)
        npc.update!(data) if updated?(npc, data)
      else
        npc = NPC.create!(data)
      end

      fixed_cards.each do |card|
        NPCCard.find_or_create_by!(npc_id: npc.id, card_id: card, fixed: true)
      end

      variable_cards.each do |card|
        NPCCard.find_or_create_by!(npc_id: npc.id, card_id: card, fixed: false)
      end

      rewards.each do |card|
        NPCReward.find_or_create_by!(npc_id: npc.id, card_id: card)
      end

      difficulty = weighted_average(npc.fixed_cards, npc.fixed_cards.length) +
        weighted_average(npc.variable_cards, 5 - npc.fixed_cards.length)
      npc.update!(difficulty: difficulty)

      npc.update!(patch: npc.rewards.pluck(:patch).min) unless npc.patch.present?
    end

    counts.each do |klass, count|
      class_name = klass.to_s.classify
      puts "Created #{class_name.constantize.send(:count) - count} new #{class_name}s"
    end
  end
end

def get_coordinate(value, map_offset, size_factor)
  scale = size_factor / 100.0
  offset = (value + map_offset) * scale
  (((41.0 / scale) * ((offset + 1024.0) / 2048.0)) + 1).to_i
end

def weighted_average(cards, count)
  return 0 if count == 0
  cards.average(:stars) * (count / 5.0)
end
