class Passenger < ApplicationRecord
    # Validations
    validates :name, presence: true
    validates :eamil, presence: true
end
