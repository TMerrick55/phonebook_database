require 'sinatra'
require 'pg'

load './local_env.rb' if File.exists?('./local_env.rb')
db_params = {
	host: ENV['host'],
	port: ENV['port'],
	dbname: ENV['db_name'],
	user: ENV['user'],
	password: ENV['password']}
	db = PG::Connection.new(db_params)

	get '/' do
		phonebook=db.exec("SELECT first_name, last_name, street_address, city, state, zip, cell_phone, home_phone FROM phonebook");
		erb :index, locals: {phonebook: phonebook}
	end

	post '/phonebook' do
		first_name = params[:first_name]
		last_name = params[:last_name]
		street_address = params[:street_address]
		city = params[:city]
		state = params[:state]
		zip = params[:zip]
		cell_phone = params[:cell_phone]
		home_phone = params[:home_phone]

		db.exec("INSERT INTO phonebook (first_name, last_name, street_address, city, state, zip, cell_phone, home_phone) VALUES('#{first_name}', '#{last_name}', '#{street_address}', '#{city}', '#{state}', '#{zip}', '#{cell_phone}', '#{home_phone}')");
		redirect '/'
	end

	post '/update_first_name' do    
		first_name_update = params[:first_name_update]    
		first_name = params[:first_name]
		db.exec("UPDATE phonebook SET first_name = '#{first_name_update}' 
			WHERE first_name = '#{first_name}' ");
		redirect '/'
	end

	post '/update_last_name' do    
		last_name_update = params[:last_name_update]
		last_name = params[:last_name]
		db.exec("UPDATE phonebook SET last_name = '#{last_name_update}' 
			WHERE last_name = '#{last_name}' ");
		redirect '/'
	end

	post '/update_street_address' do    
		street_address_update = params[:street_address_update]
		street_address = params[:street_address]
		db.exec("UPDATE phonebook SET street_address = '#{street_address_update}' 
			WHERE street_address = '#{street_address}' ");
		redirect '/'
	end

	post '/update_city' do    
		city_update = params[:city_update]
		city = params[:city]
		db.exec("UPDATE phonebook SET city = '#{city_update}' 
			WHERE city = '#{city}' ");
		redirect '/'
	end

	post '/update_state' do    
		state_update = params[:state_update]
		state = params[:state]
		db.exec("UPDATE phonebook SET state = '#{state_update}' 
			WHERE state = '#{state}' ");
		redirect '/'
	end

	post '/update_zip' do    
		zip_update = params[:zip_update]
		zip = params[:zip]
		db.exec("UPDATE phonebook SET zip = '#{zip_update}' 
			WHERE zip = '#{zip}' ");
		redirect '/'
	end

	post '/update_cell_phone' do    
		cell_phone_update = params[:cell_phone_update] 
		cell_phone = params[:cell_phone]
		db.exec("UPDATE phonebook SET cell_phone = '#{cell_phone_update}' 
			WHERE cell_phone = '#{cell_phone}' ");  
		redirect '/'
	end

	post '/update_home_phone' do    
		home_phone_update = params[:home_phone_update]
		home_phone = params[:home_phone]
		db.exec("UPDATE phonebook SET home_phone = '#{home_phone_update}' 
			WHERE home_phone = '#{home_phone}' ");   
		redirect '/'
	end