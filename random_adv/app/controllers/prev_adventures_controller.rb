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
			# actual_user = User.find(session[:user_id])
		@current_user = User.find(session[:user_id])
			#Wunderground weather API
			response = HTTParty.get("http://api.wunderground.com/api/abc3ed8ecb8d84a6/conditions/q/NY/new_york.json")
			temperature = response["current_observation"]["temp_f"]
			weather = response["current_observation"]["weather"]

			@icon = response["current_observation"]["icon_url"]
			@current_forecast = "#{weather} #{temperature} F°"
		@current_user = User.find(session[:user_id])
		@new_user_prev_adventure = PrevAdventure.new

	end

	def create

		if logged_in? && check_current_user? #this is our definition of logged in
			
			
			#logic for randomizer
			@new_array = Adventure.where("timeframe <= ? AND per_person <= ?", amount_time, amount_spend)
			@new_adventure = @new_array.sample

			#adventure id
			@adventure_id = @new_adventure.id
			#create the new previous adventure
			
			#check our work
			puts @new_adventure
			puts @new_prev_adventure

			redirect_to '/users/2/prev_adventures'
		else
			@current_user = User.find(session[:user_id])


		
			#timeframe selected
			amount_time = params[:amount_time]
			#people selected
			amount_people = params[:amount_people]
			#amount selected
			amount_spend = params[:amount_spend]
			#user id
			@user_id = params[:user_id]

			@new_array = Adventure.where("timeframe <= ? AND per_person <= ?", amount_time, amount_spend)
			@new_adventure = @new_array.sample
	#adventure id
			@adventure_id = @new_adventure.id
				PrevAdventure.create({:user_id => @user_id, :adventure_id => @adventure_id})
				redirect_to user_adventure_path(@user_id,@adventure_id)
		end
	end


	
end