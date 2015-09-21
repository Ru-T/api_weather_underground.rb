require 'minitest/autorun'
require 'minitest/pride'
require './condition.rb'
require './ten_day_forecast.rb'
require 'json'

class Condition
  private def get_response
    file = File.open('27701-weather.json') #File.read and below JSON.parse
    JSON.load(file)
  end
end

class AstronomyTest < Minitest::Test

  def test_current_weather
    assert_equal "Overcast", Condition.new("27701").weather
  end

  def test_current_temperature
    assert_equal 72.0, Condition.new("27701").temperature
  end

  def test_current_humidity
    assert_equal "89%", Condition.new("27701").humidity
  end

end
