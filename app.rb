require 'sinatra'
require 'sinatra/contrib/all'
require_relative 'controllers/burgers_controller'
require_relative 'controllers/deals_controller'
require_relative 'controllers/joints_controller'
require_relative 'models/deal'

get '/' do
  @burgers = Burger.all
  erb :index
end

#map key: AIzaSyDxUuOlDBUjSOYzkyOc6ct7oEFc3nBelhU 
