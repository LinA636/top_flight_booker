class FlightsController < ApplicationController
    def index 
        # logic for the form to use
        @available_dates = Flight.pluck(:start_datetime).map(&:to_date).uniq

        # logic for retrieving flights based on the selected date
        @flights = query_flights
        @num_passengers = params[:num_passengers]
    end


    private

    def flight_params
        params.require(:flight)
            .permit(:departure_airport_id, :arrival_airport_id, 
                    :num_passengers, :start_datetime)  
    end

    def query_flights
        # Build a query based on the submitted form criteria
        flights_query = Flight.all

        if params[:departure_airport_id].present?
            flights_query = flights_query.where(departure_airport_id: params[:departure_airport_id])
        end

        if params[:arrival_airport_id].present?
            flights_query = flights_query.where(arrival_airport_id: params[:arrival_airport_id])
        end

        if params[:start_datetime].present?
            @start_datetime = params[:start_datetime]
            # Assuming start_datetime is a DateTime field, adjust if necessary
            flights_query = flights_query.where(start_datetime: @start_datetime)
        end

        flights_query
    end
end
