require 'sinatra/activerecord'

class Destination < ActiveRecord::Base
  validates_presence_of :name,
                        :full_address,
                        :longitude,
                        :latitude

  def self.add_destination(response)
    place_info = response["candidates"].first
    Destination.create(
      name: place_info["name"],
      full_address: place_info["formatted_address"],
      latitude: place_info["geometry"]["location"]["lat"],
      longitude: place_info["geometry"]["location"]["lng"]
    )
  end
end
