require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/deal'

get '/deals' do
  @burgers = Burger.all
  erb :"deals/index"
end

### NEW ###
get '/deals/new' do
  @burgers = Burger.all ||= []
  @deals = Deal.all ||= []
  erb :"deals/new"
end

post '/deals' do
  new_deal = Deal.new(params)
  new_deal.save
  redirect to "/deals"
end

get '/deals/:id' do
  @burgers = Burger.all
  @joints = Joint.all
  @deal = Deal.find_id(params['id'])
  erb :'deals/show'
end



### EDIT ###
get '/deals/:id/edit' do
  @burgers = Burger.all ||= []
  @deal = Deal.find_id(params['id'])
  @deals = Deal.all
  erb :"deals/edit"
end

post '/deals/:id' do
  deal = Deal.new(params)
  deal.update
  redirect to '/deals'
end

### DELETE ###
post '/deals/:id/delete' do
  deal = Deal.find_id params['id']
  deal.delete
  redirect to '/deals'
end
