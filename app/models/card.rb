class Card < ApplicationRecord
  has_many :comments
  belongs_to :card_clan
  has_one_attached :image
  validates :name, :power, :shield, :grade, :race, :effect, :format, presence: true
end
