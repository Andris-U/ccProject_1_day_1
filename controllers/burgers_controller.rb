require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/burger'

get '/burgers' do
  erb :"burgers/index"
end
