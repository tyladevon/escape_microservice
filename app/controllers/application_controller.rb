require 'sinatra'
require 'rubygems'
require 'json'
require 'sinatra/activerecord'
require './app/models/destination'
require './app/services/google_places_service'

class ApplicationController < Sinatra::Base
  get '/' do
    "Root page of Sinatra App - Microservice API"
  end

  get '/api/v1/destination/:place' do
    content_type :json
    response = GooglePlacesService.search_destination(params["place"])
    place_info = response["candidates"].first
    destination = Destination.create(
      name: place_info["name"],
      full_address: place_info["formatted_address"],
      latitude: place_info["geometry"]["location"]["lat"],
      longitude: place_info["geometry"]["location"]["lng"]
    )
    response.to_json
  end
end
