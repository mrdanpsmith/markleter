require './markleter'
require './models/marklet'

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/markleter')
DataMapper.finalize

run Sinatra::Application
