class BookingsController < ApplicationController
  before_action :set_listing, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.listing = @listing
    @booking.user = current_user

    if @booking.save
      redirect_to booking_confirmation_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    raise
    @booking = Booking.find(params)
  end

  def confirmation
    @booking = Booking.find(params[:id])
  end

  def check_availability

  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def booking_params
    params.require(:booking).permit(:date_from, :date_to)
  end

end
