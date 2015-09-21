require 'httparty'
require 'byebug'

class Sun

  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  def sunrise_sunset_time (index)
    if @response["tide"]["tideSummary"][index]["data"]["type"] = "Sunset"
      @response["tide"]["tideSummary"][index]["date"]["pretty"]
    elsif @response["tide"]["tideSummary"][index]["data"]["type"] = "Sunrise"
      @response["tide"]["tideSummary"][index]["date"]["pretty"]
    else
      "There is no info for this day."
    end
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/tide/q/#{@zip_code}.json")
  end

end
