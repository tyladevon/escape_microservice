require 'spec_helper'

describe "Destination places endpoint" do
  include Rack::Test::Methods

  def app
    ApplicationController
  end

  it "can retrieve a valid place" do
    denver_name = "Denver"
    denver_address = "Denver, CO, USA"
    denver_lat = 39.7392358
    denver_lng = -104.990251

    get "/api/v1/destination/#{denver_name}"
    expect(last_response).to be_successful

    parsed_response = JSON.parse(last_response.body)
    place_info = parsed_response["candidates"].first

    expect(place_info["name"]).to eq(denver_name)
    expect(place_info["formatted_address"]).to eq(denver_address)
    expect(place_info["geometry"]["location"]["lat"]).to eq(denver_lat)
    expect(place_info["geometry"]["location"]["lng"]).to eq(denver_lng)
  end
end
