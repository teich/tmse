require 'dalli'

if ENV['MEMCACHE_SERVERS']
  $cache = Dalli::Client.new
else
  $cache = Dalli::Client.new('localhost:11211')
end

get '/' do
  # $cache.increment 'counter'
  $cache.set('counter', 1)
  @hits = $cache.get('counter')
  erb :index
end

get '/flush' do
  $cache.flush
  redirect '/'
end