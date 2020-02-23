ENV["RACK_ENV"] ||= "test"

require 'bundler'
Bundler.require(:default, :test)

require 'rspec'
require 'capybara/dsl'
require './app/controllers/application_controller'
require 'dotenv/load'

Capybara.app = ApplicationController

RSpec.configure do |c|
  c.include Capybara::DSL
end
