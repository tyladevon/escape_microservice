
class HikesController
  def self.search(incoming_params)
    lat = incoming_params[:lat]
    lon = incoming_params[:lon]
    max_dist = incoming_params[:max_dist]
    HTTParty.get("https://www.hikingproject.com/data/get-trails?lat=#{lat}&lon=#{lon}&maxDistance=#{max_dist}&key=#{ENV['HIKE_API_KEY']}")
    # HTTParty.get("https://www.hikingproject.com/data/get-trails?lat=40.0274&lon=-105.2519&maxDistance=10&key=#{ENV['HIKE_API_KEY']}")
    # response = HTTParty.get("https://www.mountainproject.com/data/get-routes-for-lat-lon?key=#{ENV['MOUNTAIN_API_KEY']}&lat=#{incoming_params[:lat]}&lon=#{incoming_params[:lon]}&maxDistance=#{incoming_params[:maxDist]}&maxResults=2&minDiff=#{incoming_params[:min_diff]}&maxDiff=#{incoming_params[:max_diff]}")
  end
end
