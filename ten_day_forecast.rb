require 'httparty'
require 'byebug'

class Forecast

  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  def forecast_text(period)
    @response["forecast"]["txt_forecast"]["forecastday"][period]["fcttext"]
  end

  def forecast_text_all
    # array = @response["forecast"]["txt_forecast"]["forecastday"]
    # array.each {|item| item["fcttext"]}
    forecast = ""
    (0..18).step(2) {|period| forecast << forecast_text(period)}
    forecast
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/forecast10day/q/#{@zip_code}.json")
  end

end

# puts "Enter a zip code:"
# api2 = Forecast.new(gets.chomp)
# puts "#{api2.forecast_text_all}"
