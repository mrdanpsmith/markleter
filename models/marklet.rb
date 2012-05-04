require 'data_mapper'

class Marklet
	include DataMapper::Resource
	property :id,		Serial
	property :name,		String,		:length => 50
	property :source,	String,		:length => 2**10*4 
	property :marklet,	String,		:length => 2**10*6
	property :library,	String,		:length => 25
	property :created_at,	DateTime
end
