require 'httparty'
require 'byebug'

class Hurricane

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    "http://api.wunderground.com/api/#{key}/currenthurricane/view.json"
  end

  def initialize
    @response = get_response
  end

  def current_hurricane
    x = ""
    @response["currenthurricane"].each do |hurricane|
      x << hurricane["stormInfo"]["stormName_Nice"]
    end
    x
  end

end
