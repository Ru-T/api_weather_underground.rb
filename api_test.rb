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

class Forecast
  private def get_response
    file = File.open('27701-forecast.json') #File.read and below JSON.parse
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

  def test_one_day_of_ten_day_forecast
    assert_equal "Overcast with rain showers at times. Thunder possible. High near 75F. Winds NE at 5 to 10 mph. Chance of rain 40%.", Forecast.new("27701").forecast_text(0)
  end

  def test_ten_day_forecast_text
    assert_equal "Overcast with rain showers at times. Thunder possible. High near 75F. Winds NE at 5 to 10 mph. Chance of rain 40%.Cloudy early with partial sunshine expected late. Slight chance of a rain shower. High 78F. Winds NNE at 10 to 15 mph.Mostly sunny skies. High near 80F. Winds NNE at 10 to 15 mph.Overcast with rain showers at times. High 78F. Winds NNE at 10 to 20 mph. Chance of rain 60%.Rain likely. High 76F. Winds NE at 10 to 15 mph. Chance of rain 90%. Rainfall near a quarter of an inch.Rain showers in the morning becoming more intermittent in the afternoon. High 74F. Winds NE at 10 to 15 mph. Chance of rain 60%.Partly cloudy skies during the morning hours will become overcast in the afternoon. High 74F. Winds NE at 10 to 15 mph.Cloudy with periods of rain. High 74F. Winds NE at 10 to 15 mph. Chance of rain 70%. Rainfall around a half an inch.Rain showers early with overcast skies later in the day. High 77F. Winds NE at 5 to 10 mph. Chance of rain 40%.Cloudy skies early, followed by partial clearing. High near 80F. Winds NE at 5 to 10 mph.", Forecast.new("27701").forecast_text_all
  end

end
