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

	def new

		@current_user = User.find(session[:user_id])
		@new_prev_adventure = PrevAdventure.new

	end

	def create

		if logged_in? && check_current_user? #this is our definition of logged in
			@current_user = User.find(session[:user_id])

			#timeframe selected
			amount_time = params[:amount_time]
			#people selected
			amount_people = params[:amount_people]
			#amount selected
			amount_spend = params[:amount_spend]
			#user id
			@user_id = params[:user_id]
			
			#logic for randomizer
			@new_array = Adventure.where("timeframe <= ? AND per_person <= ?", amount_time, amount_spend)
			@new_adventure = @new_array.sample
			@new_prev_adventure = PrevAdventure.new

			#adventure id
			@adventure_id = @new_adventure.id
			#create the new previous adventure
			PrevAdventure.create({:user_id => @user_id, :adventure_id => @adventure_id})
			#check our work
			puts @new_adventure
			puts @new_prev_adventure

			redirect_to user_adventure_path(adventure)
		else
				# redirect_to user_path(actual_user)
		end
	end


	
end