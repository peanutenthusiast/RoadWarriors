class Destination < ApplicationRecord
  has_many :favorites, :as => :favoritable
  belongs_to :search
end
