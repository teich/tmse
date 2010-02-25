require 'sinatra'

get '/' do
  $cache.increment 'counter'
  @hits = $cache.get('counter', false)
  erb :index
end

get '/set' do
  $cache.set 'counter', 1, 0, false
  redirect '/'
end