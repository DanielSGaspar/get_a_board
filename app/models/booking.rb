class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :date_from, :date_to, presence: true
end
