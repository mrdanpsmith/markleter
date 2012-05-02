require 'data_mapper'

class Marklet
	include DataMapper::Resource

	property :id,		Serial
	property :name,		String
	property :source,	String
	property :markletized,	String
	property :created_at,	DateTime
end
