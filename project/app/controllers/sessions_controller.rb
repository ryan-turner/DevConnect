# The Session's Controller assigns session ID's or redirects to login and or homepages.
class SessionsController < ApplicationController
  def new
  	end
  
    # Creates a new session for a user. If we confirm the user has a valid emaild and password, we assign a session id and redirect to the user's profile page.
    # If we can't authenticate the user, we redirect them to the login page.
  	def create
   		@user = User.find_by_email(params[:session][:email])
    		if @user && @user.authenticate(params[:session][:password])
      			session[:user_id] = @user.id
      			redirect_to @user
    		else
      			redirect_to 'login'
    		end 
  	end
    
    # Destroys a session, and redirects to homepage.
  	def destroy
   		session[:user_id] =nil
    		redirect_to '/'
  	end
  
end
