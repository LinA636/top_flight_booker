class BookingsController < ApplicationController
    def new
      puts "Selected Flight ID: #{params[:selected_flight]}"
      @booking = Booking.new

      @flight = Flight.find(params[:selected_flight])
      @departure_airport = getAirportWithId(@flight.departure_airport_id)
      @arrival_airport = getAirportWithId(@flight.arrival_airport_id)
      @num_passangers = params[:num_passengers].to_i
    end

    def create 
      logger.debug "Params: #{params.inspect}"
    end

    private

    def booking_params
      params.require(:booking).permit(:num_passengers, :selected_flight, :name, :email)
    end

    def getAirportWithId(airport_id)
      Airport.find_by(id: airport_id)
    end

end
