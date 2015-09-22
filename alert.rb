require 'httparty'
require 'byebug'

class Alert

  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  def current_alert
    if @response["alerts"] != []
      @response["alerts"][0]["type"]
    else
      puts "There are no alerts in your area."
    end
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    "http://api.wunderground.com/api/#{key}/alerts/q/#{@zip_code}.json"
  end

end
