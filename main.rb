require 'sinatra'
require_relative 'config'

set :protection, :except => :frame_options
set :bind, '0.0.0.0'
set :port, 8080

get '/' do
  'This is the home page. You will see this if you don\'t specify any specific route.'
end
get '/messages' do
  erb :message, locals: {
    name: 'GenerasiGIGIH',
    color: 'DodgerBlue'
  }
end

get '/messages/:name' do
  name = params['name']
  color = params['color'] ? params['color'] : 'DodgerBlue'
    "<h1 style=\"background-color:#{color};\">Hello #{name}!</h1>"
  erb :message, locals: {
  name: name,
  color: color
  }
end

get '/login' do
  erb :login
end

post '/login' do
  if params['username'] == 'admin' && params['password'] == 'admin'
    return 'Logged In!'
  else
    redirect '/login'
  end
end

get '/items' do
  erb :items
end

post '/items' do
  name = params['name']
  category = params['category']
  price = params['price']
  erb :details, locals: {
    name: name,
    category: category,
    price:  price
  }
end

