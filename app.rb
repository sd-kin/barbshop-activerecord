require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


set :database, "sqlite3:barbershop.db"

class Client<ActiveRecord::Base
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
@name=params[:name]
@phone=params[:phone]
@color=params[:color]
@date=params[:date]
@barber=params[:barber]
client = Client.new(name: @name, phone: @phone, color: @color, datestamp: @date, barber: @barber)
client.save if client.new_record?

erb :visit
end 

