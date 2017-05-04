# Application Controller contains app-wide useful tools.
class ApplicationController < ActionController::Base
  # Little method that allows us to use current_user elsewhere in the code.
  helper_method :current_user

  # Sets the current user to the matching user + session ID combo.
  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end

  # Calling this will require the page to either: confirm the user has a valid session, or, direct them to the login page
  def require_user
    redirect_to '/login' unless current_user
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
