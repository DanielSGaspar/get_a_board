class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    bookings = Booking.where(["listing_id =?", record.listing_id])

    bookings.each do |booking|
      record.errors.add(attribute, "not available") if (value >= booking.date_from) && (value <= booking.date_to)
    end
  end
end


# date_ranges = bookings.map { |b| b.date_from..b.date_to }

#     date_ranges.each do |range|
#       if range.include? value
#         record.errors.add(attribute, "not available")
#       end
#     end
