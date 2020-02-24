require "sinatra"
require 'rubygems'
require 'httparty'
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
    require "pry"; binding.pry
    response.to_json
  end
end
