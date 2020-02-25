require 'sinatra'
require 'rubygems'
require 'json'
require 'sinatra/activerecord'
require './app/controllers/destinations_controller'
require './app/controllers/climbs_controller'

class ApplicationController < Sinatra::Base
  get '/' do
    "Root page of Sinatra App - Microservice API"
  end

  get '/api/v1/destination/:place' do
    content_type :json
    response = DestinationsController.search(params["place"])
    response.to_json
  end

  get '/api/v1/climb_results' do
    response = ClimbsController.search(params)
    content_type :json
    response.to_json
  end
end
