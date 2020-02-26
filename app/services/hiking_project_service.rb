class HikingProjectService
  def self.search_hikes(hike_params)
    HTTParty.get("https://www.hikingproject.com/data/get-trails?lat=#{hike_params[:lat]}&lon=#{hike_params[:lon]}&maxDistance=#{hike_params[:max_dist]}&maxResults=#{hike_params[:max_results]}&sort=distance&minStars=#{hike_params[:min_stars]}&key=#{ENV['HIKE_API_KEY']}")
  end
end
