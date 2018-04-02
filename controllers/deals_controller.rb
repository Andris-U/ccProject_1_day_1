require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/deal'

get '/deals' do
  erb :"deals/index"
end
