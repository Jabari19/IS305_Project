class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id  # Log the user in
      redirect_to '/dashboard'
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil  # Log the user out
    redirect_to '/'
  end
end
