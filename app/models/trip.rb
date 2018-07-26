class Trip < ApplicationRecord
    has_many :stop_times
    belongs_to :route
    belongs_to :calendar
    has_many :shapes
end
