require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


set :database, "sqlite3:barbershop.db"

class Client<ActiveRecord::Base
validates :name, presence: true, length: {minimum: 3}
validates :phone, presence: true
validates :datestamp, presence: true
end

class Barber<ActiveRecord::Base
end
configure do
Barber.first_or_create :name=>'Walter White'
Barber.first_or_create :name=>'Goose Freeng'
Barber.first_or_create :name=>'Tom Cruse'
Barber.first_or_create :name=>'Jesie Pinkman'
end
before do
@clients=Client.all
@barbers=Barber.all
end

get '/' do
	erb "hello"
end

get '/visit' do
erb :visit

end

post'/visit' do
@client = Client.new params[:client]
@client.save if @client.new_record?
@error=@client.errors.full_messages.uniq.join(", ") unless @client.valid? 
return erb :visit
end 

