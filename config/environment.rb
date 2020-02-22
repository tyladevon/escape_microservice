ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require

require 'dotenv'
Dotenv.load

require_all 'app'
