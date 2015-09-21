require 'httparty'
require 'byebug'
require './condition.rb'
require './ten_day_forecast.rb'
require './sun.rb'

puts "Enter a zip code:"
zip_code = gets.chomp

api = Condition.new(zip_code)
puts "The current weather is #{api.weather}."
puts "The current temperature is #{api.temperature} degrees Fahrenheit."
puts "The current relative humidity is #{api.humidity}."
puts ""

api2 = Forecast.new(zip_code)
puts "The weather over the next ten days is #{api2.forecast_text_all}."
puts ""

api3 = Sun.new(zip_code)
puts "The sunset tomorrow is at #{api3.sunrise_sunset_time(1)}."

api4 = Alert.new(zip_code)
puts "The current weather alert is #{api4.current_alert}."
