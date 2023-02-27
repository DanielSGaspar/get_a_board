class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.string :title
      t.text :description
      t.string :images
      t.integer :price
      t.string :location

      t.timestamps
    end
  end
end
