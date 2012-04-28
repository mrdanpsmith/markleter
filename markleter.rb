require 'rubygems'
require 'sinatra'
require 'haml'
require 'jsmin'

set :haml, :format => :html5

get '/' do
	haml :index
end

post '/markletize' do
	marklet = params[:marklet] 
	minned = JSMin.minify(marklet)
	haml :marklet, :locals => {:minned => minned}
end
