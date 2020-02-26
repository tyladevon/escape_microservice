class HikingProjectService
  def self.search_hikes(climb_params)
    HTTParty.get("https://www.hikingproject.com/data/get-trails?lat=#{climb_params[:lat]}&lon=#{climb_params[:lon]}&maxDistance=#{climb_params[:max_dist]}&maxResults=#{climb_params[:max_results]}&sort=distance&key=#{ENV['HIKE_API_KEY']}")
  end
end
