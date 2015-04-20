require 'bundler'
Bundler.require()

#connection
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'vacation_vacation'
)

#models
require './models/user'
require './models/location'
require './models/visit'

#routes
get '/' do
  erb :index
end


# All users
get '/api/users' do
  content_type :json
  user = User.all
  user.to_json
end

# A specific user
get '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.to_json
end

# Create a new user
post '/api/users' do
  content_type :json
  user = User.create(params[:user])
  user.to_json
end

# Update an existing user
put '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.update(params[:user])
  user.to_json
end

# Update an existing user
patch '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.update(params[:user])
  user.to_json
end

# Delete an existing user
delete '/api/users/:id' do
  content_type :json
  User.delete(params[:id].to_i)
  {message: 'Successfully Deleted!'}.to_json
end

# All locations
get '/api/locations' do
  content_type :json
  loca = Location.all
  loca.to_json
end

# A specific location
get '/api/locations/:id' do
  content_type :json
  loca = Location.find(params[:id].to_i)
  loca.to_json
end

# Create a new location
post '/api/locations' do
  content_type :json
  loca = Location.create(params[:location])
  loca.to_json
end

# Update an existing location
put '/api/locations/:id' do
  content_type :json
  loca = Location.find(params[:id].to_i)
  loca.update(params[:location])
  loca.to_json
end

# Update an existing location
patch '/api/locations/:id' do
  content_type :json
  loca = Location.find(params[:id].to_i)
  loca.update(params[:location])
  loca.to_json
end

# Delete an existing location
delete '/api/locations/:id' do
  content_type :json
  Location.delete(params[:id].to_i)
  {message: 'Seccessfully deleted location'}.to_json
end

# All visits
get '/api/visits' do
  content_type :json
  visit = Visit.all
  visit.to_json
end

# A specific visit
get '/api/visits/:id' do
  content_type :json
  visit = Visit.find(params[:id].to_i)
  visit.to_json
end

# Create a new visit
post '/api/visits' do
  content_type :json
  visit = Visit.create(params[:visit])
  visit.to_json(:include => [:user, :location])
end

# Update an existing
put '/api/visits/:id' do
  content_type :json
  visit = Visit.find(params[:id].to_i)
  visit.update(params[:chirp])
  visit.to_json
end

# Update an existing visit
patch '/api/visits/:id' do
  content_type :json
  visit = Visit.find(params[:id].to_i)
  visit.update(params[:chirp])
  visit.to_json
end

# Delete an existing visit
delete '/api/visits/:id' do
  content_type :json
  Visit.delete(params[:id].to_i)
  {message: 'Succesfully Deleted!'}.to_json
end
