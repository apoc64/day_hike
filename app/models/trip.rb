class Trip < ApplicationRecord
  has_many :trail_trips #, dependent: :delete_all
  has_many :trails, through: :trail_trips



end
