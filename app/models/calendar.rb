class Calendar < ApplicationRecord
    serialize :days, Array
    has_many :trips
end