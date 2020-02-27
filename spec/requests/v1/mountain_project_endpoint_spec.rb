require 'spec_helper'

describe "Mountain Project API endpoint" do
  include Rack::Test::Methods
  def app
    ApplicationController
  end

  it "can retrieve climb routes with given query params", :vcr do
    lat_param = 40.03
    lon_param = -105.25
    max_dist_param = 10
    min_diff_param = 5.7
    max_diff_param = 5.12

    get "/api/v1/climb_results",
    params={lat: lat_param,
            lon: lon_param,
            max_dist: max_dist_param,
            min_diff: min_diff_param,
            max_diff: max_diff_param}

    expect(last_response).to be_successful

    parsed_routes = JSON.parse(last_response.body)["routes"]

    expect(parsed_routes.count).to eq(50)

    first_route = parsed_routes.first
    expect(first_route["name"]).to eq("The Naked Edge")
  end

  # it "text" do
  #
  # end
end
