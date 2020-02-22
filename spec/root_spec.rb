ENV['RACK_ENV'] = 'test'
require 'rubygems'
require 'steak'
require 'capybara/dsl'
require 'rack/test'
require 'rspec'
RSpec.configure do |config|
  config.include Capybara
end

require File.expand_path '../../app/controllers/application_controller.rb', __FILE__
Capybara.app = Sinatra::Application

module RSpecMixin
  include Rack::Test::Methods
  def app() described_class end
end

# For RSpec 2.x and 3.x
RSpec.configure { |c| c.include RSpecMixin }

describe "My Sinatra Application" do
  it "should allow accessing the home page" do
    visit '/'
  end
end
