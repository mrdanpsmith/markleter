require 'rubygems'
require 'sinatra'
require 'haml'
require 'yui/compressor'

set :haml, :format => :html5

get '/' do
	haml :index
end

post '/markletize' do
	marklet = params[:marklet] 
	compressor = YUI::JavaScriptCompressor.new(:munge => false)
	minned = compressor.compress(marklet)
	haml :marklet, :locals => {:minned => minned}
end
