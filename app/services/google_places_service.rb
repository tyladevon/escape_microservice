require 'httparty'

class GooglePlacesService
  def self.search_destination(place)
    HTTParty.get("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{place}&inputtype=textquery&fields=geometry/location,formatted_address,name&key=#{ENV['GOOGLE_API_KEY']}")
  end
end
