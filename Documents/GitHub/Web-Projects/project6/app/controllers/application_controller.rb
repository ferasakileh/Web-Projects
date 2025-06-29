class ApplicationController < ActionController::Base

  include SessionsHelper

  private
  # Ensure the user is logged in
  def require_login
    unless logged_in?
      flash[:alert] = "You must log in to access this section."
      redirect_to login_url
    end
  end
end
