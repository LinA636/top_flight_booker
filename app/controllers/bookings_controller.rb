class BookingsController < ApplicationController
    def new
      @booking = Booking.new
      @flight = params[:flight]
      @num_passangers = params[:num_passengers]
    end

    def create 
        
    end

    private

    def booking_params
      params.require(:booking).permit(:num_passengers, :flight)
      
    end
end
