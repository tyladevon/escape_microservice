ENV["RACK_ENV"] ||= "test"

require 'bundler'
Bundler.require(:default, :test)

require 'rspec'
require 'capybara/dsl'
require './app/controllers/application_controller'
require 'dotenv/load'
require 'webmock/rspec'
require 'database_cleaner/active_record'

Capybara.app = ApplicationController

RSpec.configure do |config|
  config.include Capybara::DSL

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data('<GOOGLE_API_KEY>') { ENV['GOOGLE_API_KEY'] }
  config.configure_rspec_metadata!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    # Keep as many of these lines as are necessary:
    with.library :active_record
    with.library :active_model
  end
end
