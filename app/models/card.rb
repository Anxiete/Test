class Card < ApplicationRecord
  has_many :comments
  belongs_to :card_clan
end
