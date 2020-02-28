### About Escape-Microservice

This Sinatra application is the backend to [Escape](https://github.com/mintona/escape_app). It currently consumes three external APIs, Google Places, Mountain Project, and Hiking Project. We customized all the endpoints to return information required for Escape's UI.


### Purpose Behind the Build

We used Sinatra for its lightweight build.


### Installation

#### Access Locally

**Clone the Sinatra microservice** with:

`git clone git@github.com:mintona/escape_microservice.git`

`cd escape-microservice`

`bundle install`

`bundle exec rake db:create`

API Keys Necessary:

[Google Places API](https://developers.google.com/places/web-service/intro)

[Mountain Project API](https://www.mountainproject.com/data)

[Hiking Project API](https://www.hikingproject.com/data)

*Gems Used:*

Production:
* sinatra
* pg
* activerecord
* sinatra-activerecord
* rake
* httparty
* json
* dotenv
* fast_jsonapi
* pry

Testing and Development:
* pry
* rspec
* rspec-core
* rack-test
* capybara
* webmock
* vcr
* shoulda-matchers
* database-cleaner-active-record


### Endpoints

These are the available endpoints escape-microservice hits, along with both the required and possible query parameters.

The base url to query is: https://escape-app-api.herokuapp.com/api/v1/

No API key is required.

## Location
**Details coming soon!

`destination/:place`

## Climbing
**Details coming soon!

## Hiking
**Details coming soon!

### Future Iterations
**Details coming soon!
