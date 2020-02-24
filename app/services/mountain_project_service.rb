class MountainProjectService
  def self.search_routes(incoming_params)
    response = HTTParty.get("https://www.mountainproject.com/data/get-routes-for-lat-lon?key=#{ENV['MOUNTAIN_API_KEY']}&lat=#{incoming_params[:lat]}&lon=#{incoming_params[:lon]}&maxDistance=#{incoming_params[:maxDist]}&maxResults=2&minDiff=#{incoming_params[:min_diff]}&maxDiff=#{incoming_params[:max_diff]}")
  end
end 