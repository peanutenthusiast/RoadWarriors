class User < ApplicationRecord
  has_many :favorites, :as => :favoritable
  has_many :searches
end
