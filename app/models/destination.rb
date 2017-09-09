class Destination < ApplicationRecord
  has_many :favorites, :as => :favoritable
  has_many :searches
  has_many :users, through: :searches
end
