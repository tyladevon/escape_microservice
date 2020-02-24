require './app/models/destination'
require './app/services/google_places_service'
require './app/serializers/destination_serializer'

class DestinationsController
  def self.search(place)
    response = GooglePlacesService.search_destination(place)
    destination = Destination.add_destination(response)
    json_response = DestinationSerializer.new(destination)
    return json_response
  end
end
