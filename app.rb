#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'pony'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	#@error = 'smth wrong'
	erb :about
end

get '/contacts' do
	erb :contacts
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@user = params[:username]
	@phone = params[:phone]
	@datetime = params[:dt]	
	@barber = params[:barber]
	@color = params[:color]
			
	hh = {:username => 'Enter your name', 
	:phone => 'Enter your phone', :dt => 'Enter your date & time'}

	hh.each do |key, value|		
		
		if params[key] == ''
			@error = hh[key]
		return erb :visit
		end
		
	end
	
	#f = File.open "./public/users.txt", 'a'
	#	f.write "User - #{@user}, datetime - #{@datetime}, phone - #{@phone}, barber #{@barber}"
	#	f.close
	#	@title = "Dear #{@user}! Come at #{@datetime}."
	#f.close

	erb "OK, #{@user} come at #{@datetime}."
end

post '/contacts' do
	
	@emailforcontact = params[:emailforcontact]
	@name = params[:name]
	@message = params[:message]

	hh = {:emailforcontact => 'Enter your mail',
		:name => 'Enter your name',
		:message => 'Enter your message'}

		hh.each do |k, v|
			if params[k] == ''
				@error = hh[k]
				return erb :contacts
			end
		end
 	
 	erb 'Thanks for your message. We will answer you as soon as possible'
end


#Pony.mail({
  #:to => 'you@example.com',
  #:via => :smtp,
  #:via_options => {
   # :address              => 'smtp.gmail.com',
    #:port                 => '587',
    #:enable_starttls_auto => true,
    #:user_name            => 'romeopanasak@gmail.com',
    #:password             => '9raKam@1q)&',
    #:authentication       => :plain, 					# :plain, :login, :cram_md5, no auth by default
    #:domain               => "localhost.localdomain" 	# the HELO domain provided by the client to the server
  #}
#})