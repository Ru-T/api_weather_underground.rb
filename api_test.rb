require 'minitest/autorun'
require 'minitest/pride'
require './condition.rb'
require './application.rb'
require 'json'

# class Astronomy
#   private def get_response
#     file = File.open('sydney.json') #File.read and below JSON.parse
#     JSON.load(file)
#   end
# end
#
#
class AstronomyTest < Minitest::Test

#Current conditions at that location.
  def test_current_weather_conditions
    #     assert_equal 8, Astronomy.new("Sydney").age_of_moon


  end

end
