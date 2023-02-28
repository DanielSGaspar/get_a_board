class ListingsController < ApplicationController

  def index
    @listings = Listing.all
    @search = params["search"]
    if @search.present?
      @category = @search["category"]
      @listings = Listing.where(category: @category)
    end
  end

  def show
    @listing = Listing.find(params[:id])
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
    params.require(:listing).permit(:title, :category, :description)
  end

end
