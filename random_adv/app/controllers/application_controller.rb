class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  ######################################################################
  #to make our codes 'DRY', use these methods in our users_controller.rb

  #checks to see if there is a session 
  def logged_in?
  	if session[:user_id]
  		true
  	else
  		false
  	end
  end

  #checks the current session user_id matches the user params id
  def check_current_user?
  	if session[:user_id] == params[:id].to_i
  		true
  	else
  		false
  	end
  end

end
