class Booking < ApplicationRecord
    # many-to-many association through Booking between passanger and flight
    belongs_to :flight
    has_many :passengers, :dependent => :destroy
    accepts_nested_attributes_for :passengers
end
