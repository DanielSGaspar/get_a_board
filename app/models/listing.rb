class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :category, :title, :description, presence: true
end
