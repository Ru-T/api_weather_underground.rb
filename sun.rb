require 'httparty'
require 'byebug'

class Sun

  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/#{@zip_code}.json")
  end

  def sunrise_time
    hour = @response["sun_phase"]["sunrise"]["hour"]
    minute = @response["sun_phase"]["sunrise"]["minute"]
    "#{hour}:#{minute} AM"
  end

 def sunset_time
   hour = @response["sun_phase"]["sunset"]["hour"]
   minute = @response["sun_phase"]["sunset"]["minute"]
   "#{hour}:#{minute} PM"
 end

end
