begin
  # Require the preresolved locked set of gems.
  require File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  # Fallback on doing the resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup
end

require 'app'
require 'memcached'

$cache = Memcached.new(ENV["MEMCACHE_SERVERS"])

run Sinatra::Application

