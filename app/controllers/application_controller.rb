require "sinatra"
require 'sinatra/activerecord'

class ApplicationController < Sinatra::Base
  configure do
    set :view, "app/views"
  end
  get '/' do
    "This is an example route"
  end
end
