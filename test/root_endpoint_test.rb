ENV['APP_ENV'] = 'test'

require './app/controllers/application_controller'
require 'test/unit'
require 'rack/test'
require 'dotenv/load'

class RootEndpointTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    ApplicationController
  end

  def test_it_has_a_root_endpoint
    get '/'
    assert last_response.ok?
    assert_equal 'Root page of Sinatra App - Microservice API', last_response.body
  end
end
