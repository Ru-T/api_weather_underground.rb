require 'httparty'
require 'byebug'
require './condition.rb'
require './ten_day_forecast.rb'
require './sun.rb'

puts "Enter a zip code:"

api = Condition.new(gets.chomp)
puts "The current weather is #{api.weather}."
puts "The current temperature is #{api.temperature} degrees Fahrenheit."
puts "The current relative humidity is #{api.humidity}."
