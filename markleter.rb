require 'rubygems'
require 'sinatra'
require 'haml'
require 'jsmin'

set :haml, :format => :html5

get '/' do
	haml :index
end

post '/markletize' do
	source = params[:source]
	marklet = 'javascript:(function(){' + source + '})();'
	marklet = JSMin.minify(marklet)
	haml :marklet, :locals => {:marklet => marklet, :name => params[:name]}
end
