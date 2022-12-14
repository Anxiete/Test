class Province < ApplicationRecord
  has_many :users
  validates :name, :pst, :gst, :hst, presence: true
  validates :name, length: { maximum: 100 }
  validates :pst, :gst, :hst, numericality: true
  validates :pst, :gst, :hst, numericality: { less_than: 1, greater_than_or_equal_to: 0 }
end
