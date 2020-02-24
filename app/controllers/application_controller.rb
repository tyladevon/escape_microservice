require "sinatra"
require 'sinatra/activerecord'
require 'rubygems'
require 'httparty'
require 'json'

class ApplicationController < Sinatra::Base
  get '/' do
    "Root page of Sinatra App - Microservice API"
  end

  get '/places/:destination' do
    # checks to see if the location is in the db
    # if not do below
    retrieve_coords(params["destination"])
    # create new instance of serializer
  end

  def retrieve_coords(destination)
    response = HTTParty.get("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{destination}&inputtype=textquery&fields=geometry&key=#{ENV['GOOGLE_API_KEY']}")
    coords = response["candidates"].first["geometry"]["location"]
    #  # mocked coords
    # coords = {"lat"=>39.7392358, "lng"=>-104.990251} # denver
    # coords = {"lat"=>29.7604267, "lng"=>-95.3698028} # houston
  end

  get '/api/v1/climb_results' do
    lat = 40.03
    # params['lat']
    lon = -105.25
    # params['lon']
    max_dist = 10
    # params['max_dist']
    min_diff = 5.7
    # params['min_diff']
    max_diff = 5.12
    # params['max_diff']

    # incoming_params = {:lat => 40.03,
    #           :lon => -105.25,
    #           :max_dist => 10,
    #           :min_diff => 5.7,
    #           :max_diff => 5.12
    #         }

    climb_data_results(lat, lon, max_dist, min_diff, max_diff)
  end

  def climb_data_results(lat, lon, max_dist, min_diff, max_diff)
    response = HTTParty.get("https://www.mountainproject.com/data/get-routes-for-lat-lon?
      key=#{ENV['MOUNTAIN_API_KEY']}&
      lat=#{lat}&lon=#{lon}&
      maxDistance=#{max_dist}&
      maxResults=2&
      minDiff=#{min_diff}&maxDiff=#{max_diff}")

      content_type :json
      response.to_json
  end

  private

  # def climb_params
  #   params.permit(:min_diff, :max_diff, :maxDist, :lat, :lon)
  # end
end
