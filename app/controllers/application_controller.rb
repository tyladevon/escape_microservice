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

  get '/api/v1/climb_results' do
    climb_data_results(params)
  end

  def climb_data_results(climb_params)
    response = HTTParty.get("https://www.mountainproject.com/data/get-routes-for-lat-lon?
      key=#{ENV['MOUNTAIN_API_KEY']}&
      lat=#{climb_params[:lat]}&lon=#{climb_params[:lon]}&
      maxDistance=#{climb_params[:maxDist]}&
      maxResults=2&
      minDiff=#{climb_params[:min_diff]}&maxDiff=#{climb_params[:max_diff]}")

      content_type :json
      response.to_json
  end
end
