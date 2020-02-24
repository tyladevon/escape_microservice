require 'spec_helper'

describe "Destination places endpoint" do
  include Rack::Test::Methods

  def app
    ApplicationController
  end

  it "can retrieve a valid place", :vcr do
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

  it "can retrieve a valid place from database", :vcr do
    ryans_destination = Destination.create(
      name: 'RyansHouse',
      full_address: '123 Main',
      longitude: 100.00123,
      latitude: -20.3412
    )

    get "/api/v1/destination/#{ryans_destination.name}"
    expect(last_response).to be_successful
    parsed_response = JSON.parse(last_response.body)
    place_info = parsed_response["data"]["attributes"]

    expect(place_info["name"]).to eq(ryans_destination.name)
    expect(place_info["full_address"]).to eq(ryans_destination.full_address)
    expect(place_info["latitude"]).to eq(ryans_destination.latitude)
    expect(place_info["longitude"]).to eq(ryans_destination.longitude)
  end

  it "returns nil for invalid place", :vcr do
    random_invalid_place = "dmqwmd"
    get "/api/v1/destination/#{random_invalid_place}"
    expect(last_response).to be_successful
    parsed_response = JSON.parse(last_response.body)
    place_info = parsed_response["data"]["attributes"]

    expect(place_info).to eq(nil)
  end
end
