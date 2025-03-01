Rails.application.routes.draw do
  root 'home#index'  # Default root path to homepage (can be customized)

  # User authentication routes
  get '/signup', to: 'users#new'      # Show signup form
  post '/signup', to: 'users#create'  # Handle user signup
  get '/login', to: 'sessions#new'    # Show login form
  post '/login', to: 'sessions#create' # Handle login
  delete '/logout', to: 'sessions#destroy'  # Handle logout

  # Dashboard route for logged-in users
  get '/dashboard', to: 'dashboard#index'
end
