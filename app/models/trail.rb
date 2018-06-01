class Trail < ApplicationRecord
  has_many :trail_trips #, dependent: :delete_all
  has_many :trips, through: :trail_trips

end
