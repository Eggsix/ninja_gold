require 'sinatra'
enable :sessions

get '/' do 
	session[:gold] = 0
	session[:activities] = []
	erb :index
end

post '/process_money' do
	time = Time.new
	if params[:building] == "farm"
		gold = rand(10..20)
		session[:gold] += gold
		session[:activities] << "Earned #{gold} golds from the farm! (#{time.strftime("%Y/%m/%d %l:%M%p")})"
	elsif params[:building] == "cave"
		gold = rand(5..10)
		session[:gold] += gold
		session[:activities] << "Earned #{gold} golds from the cave! (#{time.strftime("%Y/%m/%d %l:%M%p")})"
	elsif params[:building] == "house"
		gold = rand(2..5)
		session[:gold] += gold
		session[:activities] << "Earned #{gold} golds from the house! (#{time.strftime("%Y/%m/%d %l:%M%p")})"
	elsif params[:building] == "casino"
		gold = rand(-50..50)
		session[:gold] += gold
		if gold < 0 
			session[:activities] << "<span class='red'>Earned #{gold} golds from the casino! (#{time.strftime("%Y/%m/%d %l:%M%p")})</span>"
		else
			session[:activities] << "Earned #{gold} golds from the casino! (#{time.strftime("%Y/%m/%d %l:%M%p")})"
		end
	end		
	erb :index
end