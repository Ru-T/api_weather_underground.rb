require 'httparty'
require 'byebug'

# class Astronomy
#
#   def initialize(city)
#     @city = city
#     @response = get_response
#   end
#
#   def age_of_moon
#     @response["moon_phase"]["ageOfMoon"].to_i
#   end
#
#   private def get_response
#     key = ENV['WUNDERGROUND_KEY']
#     HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/Australia/#{@city}.json")
#   end
#
# end
