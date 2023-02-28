class Listing < ApplicationRecord
  belongs_to :user

  enum :category, { surfboard: 0, longboard: 1, bodyboard: 2 }
end
