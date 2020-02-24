require './app/models/destination'
require './app/services/google_places_service'
require './app/serializers/destination_serializer'

class DestinationsController
  def self.search(place)
    place_index_in_db = Destination.find_by(name: place)

    unless place_index_in_db
      google_places_response = GooglePlacesService.search_destination(place)
      place_index_in_db = Destination.add_destination(google_places_response)
    end

    DestinationSerializer.new(place_index_in_db)
  end
end
