require 'httparty'
require 'byebug'

class Forecast

  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/forecast10day/q/#{@zip_code}.json")
  end

  def forecast_day(period)
    @response["forecast"]["txt_forecast"]["forecastday"][period]["title"]
  end

  def forecast_text(period)
    @response["forecast"]["txt_forecast"]["forecastday"][period]["fcttext"]
  end

  def forecast_text_all
    forecast = {}
    (0..18).step(2) {|period| forecast[forecast_day(period)] = forecast_text(period)}
    forecast
  end

end
