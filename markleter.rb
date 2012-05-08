require 'rubygems'
require 'sinatra'
require 'haml'
require 'base62'
require 'coderay'
require './mark'
require './models/marklet'
require './haml_helpers'

set :haml, {:format => :html5, :escape_html => true, :escape_attrs => true}

get '/' do
	@marklet = Marklet.new
	haml :index, :locals => {:marklet => @marklet }
end

post '/markletize' do
	@marklet = Marklet.new(
		:name		=> params[:name],
		:source		=> params[:source],
		:marklet	=> Mark.marklet(params[:source],params[:library]),
		:library	=> params[:library],
		:created_at	=> Time.now
	)
	if @marklet.save
		redirect "/" + @marklet.id.base62_encode
	else
		haml :index, :locals => {:marklet => @marklet }
	end
end

get '/:base62id' do
	id = params[:base62id].base62_decode
	@marklet = Marklet.get(id)
	@marklet.source = CodeRay.scan(@marklet.source, :javascript).div(:css => :class, :line_numbers => :inline)
	haml :marklet, :locals => {:marklet => @marklet}
end
