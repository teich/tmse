require 'sinatra'

get '/' do
  begin
    $cache.increment 'counter'
  rescue Memcached::NotFound
    $cache.set 'counter', 1, 0, false
  end
  @hits = $cache.get('counter', false)
  erb :index
end

get '/flush' do
  $cache.flush
  redirect '/'
end