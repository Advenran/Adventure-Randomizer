class PrevAdventuresController < ApplicationController

	def index
		# views user's past adventures
		if logged_in? && check_current_user? 
			@current_user = User.find(session[:user_id])
			@prev_adven = Prev_Aventure.find(session[:user_id])
		else
			redirect_to user_path(@current_user)
		end
	end


	
end