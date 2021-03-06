require 'httparty'
require 'byebug'
require './condition.rb'
require './ten_day_forecast.rb'
require './sun.rb'
require './alert.rb'
require './hurricane.rb'

puts "Enter a zip code:"
zip_code = gets.chomp

api = Condition.new(zip_code)
puts "The current weather is #{api.weather}."
puts "The current temperature is #{api.temperature} degrees Fahrenheit."
puts "The current relative humidity is #{api.humidity}."
puts ""

api2 = Forecast.new(zip_code)
puts "The weather over the next ten days is:"
api2.forecast_text_all.each do |k, v|
  puts "#{k}: #{v}"
end  
puts ""

api3 = Sun.new(zip_code)
puts "The sunrise is at #{api3.sunrise_time}."
puts "The sunset is at #{api3.sunset_time}."
puts ""

api4 = Alert.new(zip_code)
puts "Current status of weather alerts:"
puts api4.current_alert
puts ""

api5 = Hurricane.new
puts "Currently active hurricanes:"
puts api5.current_hurricane
