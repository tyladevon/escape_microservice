require 'spec_helper'

describe "Google Places Endpoint" do
  include Rack::Test::Methods

  def app
    ApplicationController
  end

  it "can retrieve anything" do
    get '/'
    expect(last_response).to be_successful
  end
end
