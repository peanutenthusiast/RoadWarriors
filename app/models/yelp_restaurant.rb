class YelpRestaurant < ApplicationRecord
  has_many :favorites, :as => :favoritable
end
