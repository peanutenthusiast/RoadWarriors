class Hotel < ApplicationRecord
    has_many :favorites, :as => :favoritable

end
