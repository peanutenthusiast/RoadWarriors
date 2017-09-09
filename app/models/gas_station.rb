class GasStation < ApplicationRecord
    has_many :favorites, :as => :favoritable

end
