class Card < ApplicationRecord
  has_many :comments
  belongs_to :card_clan
  has_one_attached :image
end
