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
        flights_query = []

        if params[:departure_airport_id].present?
            if flights_query.any?
                flights_query = flights_query.where(departure_airport_id: params[:departure_airport_id])
            else
                flights_query = Flight.all.where(departure_airport_id: params[:departure_airport_id])
            end
        end

        if params[:arrival_airport_id].present?
            if flights_query.any?
                flights_query = flights_query.where(arrival_airport_id: params[:arrival_airport_id])
            else
                flights_query = Flight.all.where(arrival_airport_id: params[:arrival_airport_id])
            end
        end

        if params[:start_datetime].present?
            if flights_query.any?
                flights_query = flights_query.where(start_datetime: params[:start_datetime])
            else
                flights_query = Flight.all.where(start_datetime: params[:start_datetime])
            end
        end

        flights_query
    end
end
