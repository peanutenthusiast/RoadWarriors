class YelpRestaurant < ApplicationRecord
  has_many :favorites, :as => :favoritable
  has_many :users, through: :favorites
end
