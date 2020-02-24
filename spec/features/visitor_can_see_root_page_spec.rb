require 'spec_helper'

describe "Visitor can see root page" do
  include Rack::Test::Methods

  def app
    ApplicatoinController
  end

  it "Successful" do
    visit '/'
    expected_content = "Root page of Sinatra App - Microservice API"
    expect(page).to have_content(expected_content)
  end
end
