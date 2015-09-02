class WelcomeController < ApplicationController
	def index
		if logged_in?
			redirect_to new_user_prev_adventure_path(session[:user_id])
		else
			redirect_to '/sessions/new'
		end
	end
end