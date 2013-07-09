require 'sinatra'

get "/form" do
   erb :form
end

get "/hello/:name" do
	params[:name]
end

get "/more/*" do
   params[:splat]
end

get "/" do
   "Hello, world"
end 
	
get "/about" do
   "My name is Malik and mY cAPS Lock Is reversed"
end 
	
get '/secret' do  
  erb :secret  
end  

post '/secret' do  
  params[:secret].reverse  
end 

get '/decrypt/:secret' do  
  params[:secret].reverse  
end    

not_found do  
  halt 404, 'page not found'  
end 

def Time
time1 = Time.new

puts "Current Time : " + time1.inspect

# Time.now is a synonym:
time2 = Time.now
puts "Current Time : " + time2.inspect
end

get '/time' do
	Time.now
end
