class PrevAdventuresController < ApplicationController

	def index
		# views user's past adventures
		@current_user = User.find(session[:user_id])
		@current_user.adventures
		# @prev_adven = Prev_Adventure.where(user_id: @current_user.id)
		if logged_in? && check_current_user? 
			@current_user = User.find(session[:user_id])
			# @prev_adven = Prev_Adventure.find(session[:user_id])
		# binding.pry
		else
			# redirect_to user_path(@current_user)
		end
	end


	
end