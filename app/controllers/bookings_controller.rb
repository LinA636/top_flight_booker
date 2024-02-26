class BookingsController < ApplicationController
    def new
      @booking = Booking.new

      @flight = Flight.find(params[:selected_flight])
      @departure_airport_code = getAirportCodeWithId(@flight.departure_airport_id)
      @arrival_airport_code = getAirportCodeWithId(@flight.arrival_airport_id)
      
      
      # create Passenger objects
      params[:num_passengers].to_i.times { @booking.passengers.build }
    end

    def create 
      @booking = Booking.new(booking_params)
      puts "create Parameters: #{params.inspect}"
      if @booking.save

        puts "saved successfully"
        redirect_to booking_path(@booking), notice: 'Booking successfully saved'
      else
        puts 'failed'
        render :new, status: :unprocessable_entity
      end
    end

    def show
      @booking = Booking.find([params[:id]]).first
    end

    private

    def booking_params
      params.require(:booking).permit(:flight_id, :selected_flight, passengers_attributes: [:name, :email])
    end

    def getAirportCodeWithId(airport_id)
      Airport.find_by(id: airport_id).airport_code
    end

end
