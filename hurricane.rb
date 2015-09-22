require 'httparty'
require 'byebug'

class Hurricane

  def initialize
    @response = get_response
  end

  def current_hurricane
    x = ""
    @response["currenthurricane"].each do |hurricane|
      x << hurricane["stormInfo"]["stormName_Nice"]
    end
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    "http://api.wunderground.com/api/#{key}/currenthurricane/view.json"
  end

end
