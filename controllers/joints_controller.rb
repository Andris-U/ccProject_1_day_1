require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/joint'

get '/joints' do
  @joints = Joint.all
  erb :"joints/index"
end
