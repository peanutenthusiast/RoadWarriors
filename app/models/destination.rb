class Destination < ApplicationRecord
  has_many :favorites, :as => :favoritable
  has_many :searches
  has_many :searchers, through: :searches, source: :user
  has_many :users, through: :favorites

end
