require 'sinatra'
require 'rubygems'
require 'json'
require 'sinatra/activerecord'
require './app/controllers/destinations_controller'

class ApplicationController < Sinatra::Base
  get '/' do
    "Root page of Sinatra App - Microservice API"
  end

  get '/api/v1/destination/:place' do
    content_type :json
    response = DestinationsController.search(params["place"])
    response.to_json
  end
end
