require "sinatra"
require 'sinatra/activerecord'
require 'rubygems'
require 'httparty'

class ApplicationController < Sinatra::Base
  get '/' do
    "Root page of Sinatra App - Microservice API"
  end

  get '/places/:destination' do
    # checks to see if the location is in the db
    # if not do below
    (params["destination"])
    # create new instance of serializer
  end

  def retrieve_coords(destination)
    response = HTTParty.get("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{destination}&inputtype=textquery&fields=geometry&key=#{ENV['GOOGLE_API_KEY']}")
    coords = response["candidates"].first["geometry"]["location"]
    #  # mocked coords
    # coords = {"lat"=>39.7392358, "lng"=>-104.990251} # denver
    # coords = {"lat"=>29.7604267, "lng"=>-95.3698028} # houston
  end
end
