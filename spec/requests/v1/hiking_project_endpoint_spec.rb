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
                max_dist: 10,
                max_results: 20
      }


    expect(last_response).to be_successful
    parsed_hikes = JSON.parse(last_response.body)

    expect(parsed_hikes.count).to eq(20)

    expect(parsed_hikes.first).to have_key('name')
    expect(parsed_hikes.first).to have_key('type')
    expect(parsed_hikes.first).to have_key('summary')
    expect(parsed_hikes.first).to have_key('difficulty')
    expect(parsed_hikes.first).to have_key('stars')
    expect(parsed_hikes.first).to have_key('location')
    expect(parsed_hikes.first).to have_key('length')
    expect(parsed_hikes.first).to have_key('ascent')
    expect(parsed_hikes.first).to have_key('descent')
    expect(parsed_hikes.first).to have_key('longitude')
    expect(parsed_hikes.first).to have_key('latitude')
    expect(parsed_hikes.first).to have_key('url')
    expect(parsed_hikes.first).to have_key('high')
    expect(parsed_hikes.first).to have_key('low')
  end

  describe 'sorting' do
    it 'returns hikes sorted by distance from lat/lng', :vcr do
      get "/api/v1/hike_results?",
        params= { lat: 40.0274,
                  lon: -105.2519,
                  max_dist: 10,
                  max_results: 5,
        }


      expect(last_response).to be_successful
      parsed_hikes = JSON.parse(last_response.body)

      expect(parsed_hikes.count).to eq(5)

      expect(parsed_hikes.first["length"]).to eq(2.3)
      expect(parsed_hikes[1]["length"]).to eq(3.2)
      expect(parsed_hikes[2]["length"]).to eq(5.3)
      expect(parsed_hikes[3]["length"]).to eq(71.2)
      expect(parsed_hikes.last["length"]).to eq(3.3)
    end
  end

  describe 'default params' do
    it '10 hikes will be returned if max results is not provided', :vcr do
      get "/api/v1/hike_results?",
        params= { lat: 40.0274,
                  lon: -105.2519,
                  max_dist: 10,
        }


      expect(last_response).to be_successful
      parsed_hikes = JSON.parse(last_response.body)

      expect(parsed_hikes.count).to eq(10)
    end

    it 'max distance is 30 if none is provided', :vcr do
      get "/api/v1/hike_results?",
      params= { lat: 40.0274,
                lon: -105.2519,
                max_results: 2
              }

      expect(last_response).to be_successful
      parsed_hikes = JSON.parse(last_response.body)

      expect(parsed_hikes.count).to eq(2)
    end
  end

  describe 'no results found' do
    it 'returns 0 hikes if no results found', :vcr do
      get "/api/v1/hike_results?",

      params= { lat: 42.408476,
                lon: -103.909785,
                max_dist: 1,
              }

      expect(last_response).to be_successful
      parsed_hikes = JSON.parse(last_response.body)

      expect(parsed_hikes.count).to eq(0)
    end
  end
end
