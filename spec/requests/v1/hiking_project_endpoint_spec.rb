require 'spec_helper'

describe "Hiking Project API endpoint" do
  include Rack::Test::Methods
  def app
    ApplicationController
  end

  it "can retrieve hiking trails with given query params", :vcr do

    get "/api/v1/hike_results?",
      params= { lat: 40.0274,
                lon: -105.2519,
                max_dist: 10
      }


    expect(last_response).to be_successful
    parsed_hikes = JSON.parse(last_response.body)
    expect(parsed_hikes['trails'].count).to eq(10)

    expect(parsed_hikes).to have_key('trails')
    expect(parsed_hikes['trails'].first).to have_key('name')
    expect(parsed_hikes['trails'].first).to have_key('type')
    expect(parsed_hikes['trails'].first).to have_key('summary')
    expect(parsed_hikes['trails'].first).to have_key('difficulty')
    expect(parsed_hikes['trails'].first).to have_key('stars')
    expect(parsed_hikes['trails'].first).to have_key('location')
    expect(parsed_hikes['trails'].first).to have_key('length')
    expect(parsed_hikes['trails'].first).to have_key('ascent')
    expect(parsed_hikes['trails'].first).to have_key('descent')
    expect(parsed_hikes['trails'].first).to have_key('longitude')
    expect(parsed_hikes['trails'].first).to have_key('latitude')

  end
end
