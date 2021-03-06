require 'httparty'
require 'byebug'

class Condition

  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/#{@zip_code}.json")
  end

  def weather
    @response["current_observation"]["weather"]
  end

  def temperature
    @response["current_observation"]["temp_f"].to_i
  end

  def humidity
    @response["current_observation"]["relative_humidity"]
  end

end
