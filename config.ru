ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"
require 'rubygems'
require 'bundler'
require 'dotenv/load'

Bundler.require

require './app/controllers/application_controller'
run ApplicationController
