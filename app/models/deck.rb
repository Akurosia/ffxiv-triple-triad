# == Schema Information
#
# Table name: decks
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  rule_id    :integer
#  npc_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  rating     :integer
#  notes      :string(1000)
#

class Deck < ApplicationRecord
  before_create :set_order
  after_create :add_vote

  belongs_to :user
  belongs_to :rule, required: false
  belongs_to :npc, required: false
  has_many :deck_cards, dependent: :delete_all
  has_many :cards, through: :deck_cards
  has_many :votes, dependent: :delete_all

  scope :updated, -> { where('updated_at > ?', Deck.patch_5_5) }

  validates_with DeckValidator
  validates :rule, presence: true, unless: -> { rule_id.blank? }
  validates :npc,  presence: true, unless: -> { npc_id.blank? }

  def upvote(user)
    votes.find_or_create_by(user: user)
  end

  def downvote(user)
    votes.find_by(user: user)&.destroy
  end

  # Has the deck been updated after Patch 5.5?
  def updated?
    updated_at > Deck.patch_5_5
  end

  def self.patch_5_5
    '2021-04-11'.freeze
  end

  private
  def set_order
    deck_cards.each_with_index do |card, i|
      card.position = i + 1
    end
  end

  def add_vote
    votes.create!(user_id: self.user_id)
  end
end
