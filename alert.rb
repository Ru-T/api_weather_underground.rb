require 'httparty'
require 'byebug'

class Alert

  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/alerts/q/#{@zip_code}.json")
  end

  def current_alert
    if @response["alerts"] == []
      "There are no weather alerts in your area."
    else
      @response["alerts"].map {|alert| alert["type"]}
    end
  end

end
