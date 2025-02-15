require 'sinatra'
require 'sinatra/activerecord'
require 'mysql2'

#database
set :database, {
  adapter: 'mysql2',
  host: 'localhost',
  username: 'root',  
  password: '',      
  database: 'WorkoutDB'
}
# Define User model
class User < ActiveRecord::Base
  self.table_name = "Users"
end

# Home Route - Fetch All Users
get '/' do
  @users = User.all
  erb :index
end

# Get User by ID
get '/user/:id' do
  @user = User.find_by(id: params[:id])
  if @user
    erb :user
  else
    "User not found"
  end
end