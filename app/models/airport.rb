class Airport < ApplicationRecord
    # Many-to-many association with Airport through Flight
    has_many :departure_flights, class_name: 'Flight', foreign_key: 'departure_airport_id'
    has_many :arrival_flights, class_name: 'Flight', foreign_key: 'arrival_airport_id'

    # Validations
    validates :airport_code, presence: true
end
