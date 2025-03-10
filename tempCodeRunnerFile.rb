require 'sinatra'
require 'sinatra/activerecord'
require 'mysql2'

# Database Configuration
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

__END__

@@ layout
<!DOCTYPE html>
<html>
<head>
    <title>WorkoutDB App</title>
</head>
<body>
    <h1>Workout Database</h1>
    <%= yield %>
</body>
</html>

@@ index
<h2>Users List</h2>
<ul>
  <% @users.each do |user| %>
    <li><a href="/user/<%= user.user_id %>"><%= user.first_name %> <%= user.last_name %></a></li>
  <% end %>
</ul>

@@ user
<h2>User Details</h2>
<p><strong>Name:</strong> <%= @user.first_name %> <%= @user.last_name %></p>
<p><strong>Email:</strong> <%= @user.email %></p>
<p><strong>Role:</strong> <%= @user.role %></p>
<a href="/">Back to Users</a>
