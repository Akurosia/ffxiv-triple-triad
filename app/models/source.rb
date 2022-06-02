# == Schema Information
#
# Table name: sources
#
#  id         :bigint(8)        not null, primary key
#  card_id    :integer
#  origin     :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Source < ApplicationRecord
  belongs_to :card, touch: true

  def self.origins
    %w(NPC Dungeon Trial Raid Pack Eureka FATE Achievement Tournament MGP Other)
  end
end
