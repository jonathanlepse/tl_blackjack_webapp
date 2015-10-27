#require 'rubygems' dont think i need this for cloud 9
require 'sinatra'

use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :secret => 'some_random_string'




