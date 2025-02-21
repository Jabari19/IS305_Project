require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'
require './models/user'

set :database, { adapter: 'mysql2', database: 'workout_db', username: 'root', password: '', host: 'localhost' }

enable :sessions

get '/' do
  erb :index
end

post '/login' do
  user = User.find_by(username: params[:username])
  if user && BCrypt::Password.new(user.password_digest) == params[:password]
    session[:user_id] = user.id
    redirect '/dashboard'
  else
    "Invalid username or password."
  end
end

post '/register' do
  existing_user = User.find_by(username: params[:username])
  if existing_user
    "Username already exists."
  else
    hashed_password = BCrypt::Password.create(params[:password])
    user = User.create(username: params[:username], password_digest: hashed_password)
    session[:user_id] = user.id
    redirect '/dashboard'
  end
end

get '/dashboard' do
  @user = User.find(session[:user_id]) if session[:user_id]
  erb :dashboard
end
