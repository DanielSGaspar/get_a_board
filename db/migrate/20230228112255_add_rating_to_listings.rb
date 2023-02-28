class AddRatingToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :rating, :integer
  end
end
