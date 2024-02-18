# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Delete all records form the flight and airport tables
Flight.delete_all
Airport.delete_all


# Create Airports
airport_codes = ['NYC', 'MUC', 'HH', 'CHCH', 'AUK']

airports = airport_codes.map do |code|
    Airport.create(airport_code: code)
end


# Create Flights data
flights = []
# NYC - MUC
flights_data = []
5.times do |i|
    flights_data << {
        start_datetime: DateTime.now + i.days,
        flight_duration: 8
    }
end
flights += flights_data.each do |flight_data|
    Flight.create(
      start_datetime: flight_data[:start_datetime],
      flight_duration: flight_data[:flight_duration],
      departure_airport:  Airport.find_by(airport_code: 'NYC'),
      arrival_airport: Airport.find_by(airport_code: 'MUC')
    )
end
# NYC - AUK
flights_data = []
5.times do |i|
    flights_data << {
        start_datetime: DateTime.now + i.days,
        flight_duration: 18
    }
end
flights += flights_data.each do |flight_data|
    Flight.create(
      start_datetime: flight_data[:start_datetime],
      flight_duration: flight_data[:flight_duration],
      departure_airport:  Airport.find_by(airport_code: 'NYC'),
      arrival_airport: Airport.find_by(airport_code: 'AUK')
    )
end

flights_data = []
# HH - MUC
5.times do |i|
    flights_data << {
        start_datetime: DateTime.now + i.days,
        flight_duration: 1
    }
end
flights += flights_data.each do |flight_data|
    Flight.create(
      start_datetime: flight_data[:start_datetime],
      flight_duration: flight_data[:flight_duration],
      departure_airport:  Airport.find_by(airport_code: 'HH'),
      arrival_airport: Airport.find_by(airport_code: 'MUC')
    )
end

flights_data = []
# HH - CHCH
5.times do |i|
    flights_data << {
        start_datetime: DateTime.now + i.days,
        flight_duration: 32
    }
end
flights += flights_data.each do |flight_data|
    Flight.create(
      start_datetime: flight_data[:start_datetime],
      flight_duration: flight_data[:flight_duration],
      departure_airport:  Airport.find_by(airport_code: 'HH'),
      arrival_airport: Airport.find_by(airport_code: 'CHCH')
    )
end


