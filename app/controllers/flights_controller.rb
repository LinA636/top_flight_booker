class FlightsController < ApplicationController
    def index 
        # logic for the form to use
        @available_dates = Flight.pluck(:start_datetime).map(&:to_date).uniq

        # logic for retrieving flights based on the selected date
        
    end


    private

    def flight_params
        params.require(:flight)
            .permit(:departure_airport_id, :arrival_airport_id, 
                    :num_passangers, :start_datetime)  
    end
end
