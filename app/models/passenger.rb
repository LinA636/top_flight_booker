class Passenger < ApplicationRecord
    # many-to-many association throuth bookings
    has_many :bookings
    has_many :flights, through: :bookings
    
    # Validations
    validates :name, presence: true
    validates :eamil, presence: true
end
