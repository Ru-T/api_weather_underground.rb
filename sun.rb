require 'httparty'
require 'byebug'

class Sun

  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  def sunrise_time
    @response["sun_phase"]["sunrise"]["hour"] + ":" + @response["sun_phase"]["sunrise"]["minute"] + " AM"
  end

 def sunset_time
   @response["sun_phase"]["sunset"]["hour"] +":" + @response["sun_phase"]["sunset"]["minute"] + " PM"
 end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/#{@zip_code}.json")
  end

end
