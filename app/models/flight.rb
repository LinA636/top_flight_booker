class Flight < ApplicationRecord
    # many-to-many through association with two Airport objects
    belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'departure_airport_id'
    belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival_airport_id'

    # Validations
    validates :start_datetime, presence: true
    validates :flight_duration, presence: true
end
