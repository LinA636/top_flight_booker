class Flight < ApplicationRecord
    validates :start_datetime, presence: true
    validates :flight_duration, presence: true
end
