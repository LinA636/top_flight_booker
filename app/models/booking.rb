class Booking < ApplicationRecord
    # many-to-many association through Booking between passanger and flight
    belongs_to :flight
    has_many :passengers

    # Validations
    validates :num_passengers, presence: true
end
