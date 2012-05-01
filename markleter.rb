require 'rubygems'
require 'sinatra'
require 'haml'
require './mark'

set :haml, {:format => :html5, :escape_html => true, :escape_attrs => true}

get '/' do
	haml :index
end

post '/markletize' do
	marklet = Mark.marklet(params[:source],params[:library])
	haml :marklet, :locals => {:marklet => marklet, :name => params[:name], :source => params[:source]}
end
