# == Schema Information
#
# Table name: cards
#
#  id             :bigint(8)        not null, primary key
#  patch          :string(255)
#  card_type_id   :integer          not null
#  stars          :integer          not null
#  top            :integer          not null
#  right          :integer          not null
#  bottom         :integer          not null
#  left           :integer          not null
#  buy_price      :integer
#  sell_price     :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  sort_id        :integer
#  name_en        :string(255)      not null
#  name_de        :string(255)      not null
#  name_fr        :string(255)      not null
#  name_ja        :string(255)      not null
#  description_en :text(65535)      not null
#  description_de :text(65535)      not null
#  description_fr :text(65535)      not null
#  description_ja :text(65535)      not null
#

class Card < ApplicationRecord
  belongs_to :type, class_name: 'CardType', foreign_key: :card_type_id
  has_many :npc_rewards
  has_many :npc_sources, through: :npc_rewards, source: :npc
  has_many :sources
  has_one :pack_card
  has_one :pack, through: :pack_card
  has_and_belongs_to_many :users
  has_and_belongs_to_many :decks

  accepts_nested_attributes_for :sources

  translates :name, :description

  def stats
    "#{top} #{right} #{bottom} #{left}".gsub(/10/, 'A')
  end

  def ownership
    active_user_ids = User.active.pluck(:id)
    '%2.2f%' % ((users.where(id: active_user_ids).count / active_user_ids.size.to_f) * 100)
  end
end
