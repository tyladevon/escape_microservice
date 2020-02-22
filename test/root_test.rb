ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require './app/controllers/application_controller.rb'

class MyTest < MiniTest::Unit::TestCase

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_hello_world
    get '/'
    assert last_response.ok?
    assert_equal "Root page of Sinatra App - Microservice API", last_response.body
  end
end
