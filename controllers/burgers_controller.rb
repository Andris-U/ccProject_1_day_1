require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/burger'

get '/burgers' do
  erb :"burgers/index"
end

get '/burgers/:id' do
  @burger = Burger.find_id(params['id'])
  @deals = Deal.all
  erb :"burgers/show"
end

### NEW ###
get '/burgers/new' do
  @joints = Joint.all
  erb :"burgers/new"
end

post '/burgers' do
  new_burger = Burger.new(params)
  new_burger.save
  redirect to "/burgers"
end

### EDIT ###
get '/burgers/:id/edit' do
  @burger = Burger.find_id(params['id'])
  @joints = Joint.all
  erb :"burgers/edit"
end

post '/burgers/:id' do
  burger = Burger.new(params)
  burger.update
  redirect to '/burgers'
end

### DELETE ###
post '/burgers/:id/delete' do
  burger = Burger.find_id(params['id'])
  burger.delete
  redirect to '/burgers'
end
