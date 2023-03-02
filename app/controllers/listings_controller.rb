class ListingsController < ApplicationController

  def index
    @listings = Listing.all

    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {listing: listing})
      }
    end

    @search = params[:search]
    if @search.present?
      @listings = Listing.where(category: params[:search][:category])
    end
  end

  def show
    @listing = Listing.find(params[:id])

    @markers = [
      {
        lat: @listing.latitude,
        lng: @listing.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {listing: @listing})
      }
    ]
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :category, :description, photos: [])
  end

end
