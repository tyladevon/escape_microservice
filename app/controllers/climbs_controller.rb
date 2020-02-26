require './app/services/mountain_project_service'

class ClimbsController
  def self.search(incoming_params)
    MountainProjectService.search_routes(incoming_params)
  end
end
