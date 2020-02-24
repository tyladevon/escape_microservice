require 'spec_helper'

describe "Destination places endpoint" do
  include Rack::Test::Methods

  def app
    ApplicationController
  end

  it "can retrieve a valid place" do
    VCR.use_cassette('google_place_denver') do
      denver_name = "Denver"
      denver_address = "Denver, CO, USA"
      denver_lat = 39.7392358
      denver_lng = -104.990251

      get "/api/v1/destination/#{denver_name}"
      expect(last_response).to be_successful
      parsed_response = JSON.parse(last_response.body)
      place_info = parsed_response["data"]["attributes"]

      expect(place_info["name"]).to eq(denver_name)
      expect(place_info["full_address"]).to eq(denver_address)
      expect(place_info["latitude"]).to eq(denver_lat)
      expect(place_info["longitude"]).to eq(denver_lng)
    end
  end
end
