require 'rack'
require 'rack/contrib'
require 'sinatra'
require './app/util'
require './app/move'
require './test/test_deciders.rb'

use Rack::PostBodyContentTypeParser

appearance = {
  color: "#ecbcb4",
  head_type: "silly",
  tail_type: "skinny",
}

get '/' do
  "Battlesnake documentation can be found at <a href=\"https://docs.battlesnake.io\">docs.battlesnake.io</a>\n"
end

post '/ping' do
  "ok\n"
end

post '/start' do
  content_type :json
  camelcase(appearance).to_json
end

post '/move' do
  request = underscore(env['rack.request.form_hash'])
  response = move(request)
  content_type :json
  camelcase(response).to_json
end

post '/test' do
  request = underscore(env['rack.request.form_hash'])
  response = move(request, true)
  content_type :json
  camelcase(response).to_json
end

post '/test_deciders' do
  request = underscore(env['rack.request.form_hash'])
  response = test_deciders(request)
  content_type :json
  camelcase(response).to_json
end

post '/end' do
  "end\n"
end
