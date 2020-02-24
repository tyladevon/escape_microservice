require 'sinatra/activerecord'

class Destination < ActiveRecord::Base
  validates_presence_of :name,
                        :full_address,
                        :longitude,
                        :latitude
end
