class AddDefaultRatingToListings < ActiveRecord::Migration[7.0]
  def change
    change_column :listings, :rating, :integer, default: 4
  end
end
