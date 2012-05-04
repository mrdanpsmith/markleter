require 'rubygems'
require 'sinatra'
require 'haml'
require 'base62'
require './mark'
require './models/marklet'

set :haml, {:format => :html5, :escape_html => true, :escape_attrs => true}

get '/' do
	haml :index
end

post '/markletize' do
	@marklet = Marklet.create(
		:name		=> params[:name],
		:source		=> params[:source],
		:marklet	=> Mark.marklet(params[:source],params[:library]),
		:library	=> params[:library],
		:created_at	=> Time.now
	)
	redirect "/" + @marklet.id.base62_encode
end

get '/:base62id' do
	id = params[:base62id].base62_decode
	@marklet = Marklet.get(id)
	haml :marklet, :locals => {:marklet => @marklet}
end
