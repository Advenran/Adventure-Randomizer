class UsersController < ApplicationController


	def index
	end

	def show
		actual_user = User.find(session[:user_id])
		#grab the affairs for the user accessing the route and pass them into a template
		if logged_in? && check_current_user? #this is our definition of logged in
			@current_user = User.find(session[:user_id])
			
		else
			redirect_to user_path(actual_user)
		end
	end

	def new
		@user = User.new
	end
	# Create a new user and redirects to log in
	def create
		new_user = User.create(user_params)
		redirect_to '/login'
	end



	# Editting user's info
	def edit
		actual_user = User.find(session[:user_id])
		if logged_in? && check_current_user?
			@current_user = User.find(session[:user_id])
		else
			redirect_to new_user_adventure_path(actual_user)
		end
	end

	def update
		actual_user = User.find(session[:user_id])
		if logged_in? && check_current_user?
			@current_user = User.find(session[:user_id])
			@current_user.update(user_params)
			redirect_to edit_user_path
		else
			redirect_to new_user_adventure_path(actual_user)
		end
	end






	#to sanitize our form data
	private
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end