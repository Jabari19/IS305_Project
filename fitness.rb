require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'

set :database, { adapter: 'sqlite3', database: 'db/workout_tracker.db' }

get '/'do
  erb :index
end

class User < ActiveRecord::Base
  has_secure_password  # Provides authentication methods

  # Associations
  has_many :workouts
  has_many :nutrition
  has_many :goals
  has_many :workout_exercises, through: :workouts
end

class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises
end

class Exercise < ActiveRecord::Base
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises
end

class WorkoutExercise < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise
end

class Goal < ActiveRecord::Base
  belongs_to :user
end

class Nutrition < ActiveRecord::Base
  belongs_to :user
end

# Routes
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
  if session[:user_id]
    @user = User.find(session[:user_id])  # Retrieve user data based on session
    @workouts = @user.workouts.includes(:exercises).order(date: :desc)  # Get the workouts and exercises for the user
    @goals = @user.goals.order(target_date: :desc)  # Get the user's goals
    @nutrition = @user.nutrition.order(date: :desc)  # Get the user's nutrition records
    erb :dashboard  # This will render the user dashboard view (HTML content)
  else
    redirect '/'  # If the user is not logged in, redirect to the login page
  end
end
