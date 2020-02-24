require './app/models/destination'
require './app/services/google_places_service'

class DestinationsController
  def self.search(place)
    response = GooglePlacesService.search_destination(place)
    destination = Destination.add_destination(response)
    return response
  end
end
