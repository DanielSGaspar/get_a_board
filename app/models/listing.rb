class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :category, :title, :description, presence: true
  # Adding categories for dropdown
  enum :category, { Surfboard: 0, Longboard: 1, Bodyboard: 2 }
end
