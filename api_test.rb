require 'minitest/autorun'
require 'minitest/pride'
require './condition.rb'
require './ten_day_forecast.rb'
require './sun.rb'
require './alert.rb'
require 'json'

class Condition
  private def get_response
    file = File.open('27701-weather.json') #File.read and below JSON.parse
    JSON.load(file)
  end
end

class Forecast
  private def get_response
    file = File.open('27701-forecast.json') 
    JSON.load(file)
  end
end

class Sun
  private def get_response
    file = File.open('27701-sun.json')
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

  def test_ten_day_forecast_text
    assert /\bOvercast with rain showers at times.\b/, Forecast.new("27701").forecast_text_all
  end

  def test_sunrise_time
    assert_equal "7:02 AM", Sun.new("27701").sunrise_time
  end

  def test_sunset_time
    assert_equal "19:14 PM", Sun.new("27701").sunset_time
  end


end
