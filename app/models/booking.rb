class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :date_from, :date_to, presence: true, availability: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if date_from.blank? || date_to.blank?

    errors.add(:date_to, "must be after the start date") if date_to < date_from
  end
end
