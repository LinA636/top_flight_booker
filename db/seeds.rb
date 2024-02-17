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

flights_data = []
# NYC - MUC
5.times do |i|
    flights_data << {
        start_datetime: DateTime.now + i.days,
        flight_duration: 8
    }
end

# NYC - AUK
5.times do |i|
    flights_data << {
        start_datetime: DateTime.now + i.days,
        flight_duration: 18
    }
end

# HH - MUC
5.times do |i|
    flights_data << {
        start_datetime: DateTime.now + i.days,
        flight_duration: 1
    }
end

# HH - CHCH
5.times do |i|
    flights_data << {
        start_datetime: DateTime.now + i.days,
        flight_duration: 32
    }
end

# create flights
flights_data.each_with_index do |flight_data, index|
    Flight.create(
      start_datetime: flight_data[:start_datetime],
      flight_duration: flight_data[:flight_duration],
      departure_airport: airports[index % airports.length],
      arrival_airport: airports[(index + 1) % airports.length]
    )
end