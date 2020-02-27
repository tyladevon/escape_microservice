require 'spec_helper'

describe "Mountain Project API endpoint" do
  include Rack::Test::Methods
  def app
    ApplicationController
  end

  it "can retrieve climb routes with given query params for a place with 50+ climbs", :vcr do
    lat_param = 40.03
    lon_param = -105.25
    max_dist_param = 10
    min_diff_param = "5.7"
    max_diff_param = "5.12"

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
    expect(first_route["type"]).to eq("Trad")
    expect(first_route["rating"]).to eq("5.11b")
    expect(first_route["stars"]).to eq(4.9)
    expect(first_route["url"]).to eq("https:\/\/www.mountainproject.com\/route\/105748786\/the-naked-edge")
  end

  it "can retrieve climb routes with given query params for Eiffel tower", :vcr do
    lat_param = 48.85837009999999
    lon_param = 2.2944813
    max_dist_param = 200
    min_diff_param = "5.10"
    max_diff_param = "5.12"

    get "/api/v1/climb_results",
    params={lat: lat_param,
            lon: lon_param,
            max_dist: max_dist_param,
            min_diff: min_diff_param,
            max_diff: max_diff_param}

    expect(last_response).to be_successful

    parsed_routes = JSON.parse(last_response.body)["routes"]

    expect(parsed_routes.count).to eq(13)
    first_route = parsed_routes.first
    expect(first_route["name"]).to eq("Vive Les Femmes")
    expect(first_route["type"]).to eq("Sport")
    expect(first_route["rating"]).to eq("5.12b")
    expect(first_route["stars"]).to eq(5)
    expect(first_route["url"]).to eq("https://www.mountainproject.com/route/116558129/vive-les-femmes")
  end

  # it "text" do
  #
  # end
end
