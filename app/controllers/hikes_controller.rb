require './app/services/hiking_project_service'
require './app/serializers/hikes_serializer'

class HikesController
  def self.search(climb_params)
    hikes = HikingProjectService.search_hikes(climb_params)
    HikesSerializer.new(hikes).present
  end
end
