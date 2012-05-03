require './markleter'

configure :production do
        DataMapper.setup(:default, ENV['DATABASE_URL'])
end

configure :development do
        DataMapper.setup(:default, 'postgres://postgres:postgres@localhost/markleter')
        DataMapper.auto_upgrade!
end

configure do
	DataMapper.finalize
end

run Sinatra::Application
