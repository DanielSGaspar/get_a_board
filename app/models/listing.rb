class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :category, :title, :description, presence: true
  # Adding categories for dropdown
  enum :category, { surfboard: 0, longboard: 1, bodyboard: 2 }
end
