require 'fast_jsonapi'

class HikesSerializer
  def initialize(hikes)
    @hikes = hikes['trails']
  end

  def present
    hikes = []
    @hikes.each do |hike|
      hike_info = {}
      hike_info[:name] = hike['name']
      hike_info[:rid] = hike['id']
      hike_info[:type] = hike['type']
      hike_info[:summary] = hike['summary']
      hike_info[:difficulty] = hike['difficulty']
      hike_info[:stars] = hike['stars']
      hike_info[:location] = hike['location']
      hike_info[:length] = hike['length']
      hike_info[:ascent] = hike['ascent']
      hike_info[:descent] = hike['descent']
      hike_info[:longitude] = hike['longitude']
      hike_info[:latitude] = hike['latitude']
      hike_info[:url] = hike['url']
      hike_info[:high] = hike['high']
      hike_info[:low] = hike['low']
      hikes << hike_info
    end
    hikes
  end
end
