require 'fast_jsonapi'

class DestinationSerializer
  include FastJsonapi::ObjectSerializer
  set_type :destination
  attributes :name, :full_address, :longitude, :latitude
end
