require 'sinatra'
require 'rubygems'
require 'json'
require 'sinatra/activerecord'
require './app/controllers/destinations_controller'
require './app/controllers/climbs_controller'
require './app/controllers/hikes_controller'

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

  get '/api/v1/hike_results' do
    response = HikesController.search(params)
    # response = HTTParty.get("https://www.hikingproject.com/data/get-trails?lat=40.0274&lon=-105.2519&maxDistance=10&key=#{ENV['HIKE_API_KEY']}")
    content_type :json
    response.to_json
  end
end
