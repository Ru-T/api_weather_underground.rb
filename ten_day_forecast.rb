require 'httparty'
require 'byebug'

class Forecast

  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  def forecast_day(period)
    @response["forecast"]["txt_forecast"]["forecastday"][period]["title"]
  end

  def forecast_text(period)
    @response["forecast"]["txt_forecast"]["forecastday"][period]["fcttext"]
  end

# TO DO: Rewrite the below to show each item in the array on a different line.
  def forecast_text_all
    forecast = {}
    (0..18).step(2) {|period| forecast[forecast_day(period)] = forecast_text(period)}
    forecast

    # day = @response["forecast"]["txt_forecast"]["forecastday"][period]["title"]
    # text = @response["forecast"]["txt_forecast"]["forecastday"][period]["fcttext"]

    # forecast = []
    # (0..18).step(2) {|period| forecast << forecast_text(period)}
    # forecast#.each {|x| x}
    # until period == 20 do
    #   puts @response["forecast"]["txt_forecast"]["forecastday"][period]["title"]
    #   puts @response["forecast"]["txt_forecast"]["forecastday"][period]["fcttext"]
    #   period += 2
    # end

  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/forecast10day/q/#{@zip_code}.json")
  end

end
