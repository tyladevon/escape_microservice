require "sinatra"
require 'sinatra/activerecord'
require 'rubygems'
require 'httparty'
require 'json'

class ApplicationController < Sinatra::Base
  get '/' do
    "Root page of Sinatra App - Microservice API"
  end

  get '/api/v1/destination/:place' do
    response = HTTParty.get("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{params["place"]}&inputtype=textquery&fields=geometry/location,formatted_address,name&key=#{ENV['GOOGLE_API_KEY']}")
    content_type :json
    response.to_json
  end
end
