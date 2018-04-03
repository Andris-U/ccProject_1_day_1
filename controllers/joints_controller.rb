require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/joint'

get '/joints' do
  @joints = Joint.all
  erb :"joints/index"
end

get '/joints/new' do
  erb :"joints/new"
end

post '/joints' do
  new_joint = Joint.new params
  new_id = new_joint.save
  redirect to "joints/#{new_id}"
end

get '/joints/:id/edit' do
  @joint = Joint.find_id(params['id'])
  erb :"joints/edit"
end

post '/joints/:id' do
  joint = Joint.new(params)
  joint.update
  redirect to '/joints'
end

post '/joints/:id/delete' do
  joint = Joint.find_id(params['id'])
  joint.delete
  redirect to "/joints"
end
