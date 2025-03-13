require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'

set :database, { adapter: 'sqlite3', database: 'db/workout_tracker.db' }

class User < ActiveRecord::Base
  has_secure_password  # Provides authentication methods

  # Associations
  has_many :workouts
  has_many :nutrition
  has_many :goals
  has_many :workout_exercises, through: :workouts
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
