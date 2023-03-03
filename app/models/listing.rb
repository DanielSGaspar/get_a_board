class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :category, :title, :description, presence: true
  # Adding categories for dropdown
  enum :category, { Surfboard: 0, Longboard: 1, Bodyboard: 2 }

  def available_today?
    bookings.where(date_from: ..Date.today).where(date_to: Date.today..).empty?
  end

  def available?(from, to)
    bookings.where(date_from: ..to).where(date_to: from..).empty?
  end
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
