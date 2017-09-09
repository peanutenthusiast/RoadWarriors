class User < ApplicationRecord
  has_secure_password
  has_many :favorites, :as => :favoritable
  has_many :searches
  has_many :destinations, through: :searches
end
