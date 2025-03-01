class DashboardController < ApplicationController
  before_action :require_login  # Ensure only logged-in users can access

  def index
    @user = current_user  # Use current_user to access the logged-in user's data
  end

  private
  def require_login
    redirect_to '/login' unless current_user
  end
end
