# == Schema Information
#
# Table name: npcs
#
#  id          :bigint(8)        not null, primary key
#  x           :integer
#  y           :integer
#  resident_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  quest_id    :integer
#  patch       :string(255)
#  name_en     :string(255)      not null
#  name_de     :string(255)      not null
#  name_fr     :string(255)      not null
#  name_ja     :string(255)      not null
#  location_id :integer          not null
#

class NPC < ApplicationRecord
  has_many :npc_cards
  has_many :npc_rewards
  has_many :cards, through: :npc_cards
  has_many :fixed_cards, -> { where('npc_cards.fixed = true') }, through: :npc_cards, source: :card
  has_many :variable_cards, -> { where('npc_cards.fixed = false') }, through: :npc_cards, source: :card
  has_many :rewards, through: :npc_rewards, source: :card
  has_and_belongs_to_many :users
  has_and_belongs_to_many :rules
  belongs_to :location
  belongs_to :quest, optional: true

  translates :name
end
