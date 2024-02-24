class Passenger < ApplicationRecord
    # many-to-many association throuth bookings
    belongs_to :bookings
    has_many :flights, through: :bookings
    
    # Validations
    validates :name, presence: true
    validates :eamil, presence: true
end
