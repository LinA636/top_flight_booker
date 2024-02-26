class Passenger < ApplicationRecord
    # many-to-many association throuth bookings
    belongs_to :booking
    has_many :flights, through: :bookings
    
    # Validations
    validates :name, presence: true
    validates :email, presence: true
end
