require "HTTParty"

class AdventuresController < ApplicationController

	# include HTTParty

	def index
		
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
			# to test
			# puts "the current weather for your adventure is #{weather} and #{temperature}F!"

			@new_prev_adventure = PrevAdventure.new

			#timeframe selected
			# amount_time = params[:amount_time]
			#people selected
			# amount_people = params[:amount_people]
			#amount selected
			# amount_spend = params[:amount_spend]

			#we need to get the adventure id and the user id and create
			#a new previous adventure based on those.

			# @new_array = Adventure.where("timeframe <= ? AND per_person <= ?", amount_time, amount_spend)
			# @new_adventure = @new_array.sample
			# @new_prev_adventure = @new_adventure.prev_adventures

			# puts @new_adventure
			# puts @new_prev_adventure


		if logged_in? && check_current_user? #this is our definition of logged in
			@current_user = User.find(session[:user_id])
			#below is the code to generate a random adventure


		else
				# redirect_to user_path(actual_user)
		end

		# @new_array = Adventure.where("timeframe <= ? AND per_person <= ?", 100, 50)
		# @new_adventure = @new_array.sample
		# @new_prev_adventure = @new_adventure


	end

	def show

		@adventure_choice = Adventure.find(params[:id])
		end_location = @adventure_choice.location
		@current_user = User.find(params[:user_id])
		api_key = ENV["WING_IT_GOOGLE"]





		response = HTTParty.get("https://maps.googleapis.com/maps/api/directions/json?origin=place_id:ChIJT3jEwaNZwokRS-hniJsDhDg&destination=place_id:#{end_location}&mode=walking&key=#{api_key}")


		@directions = response["routes"][0]["legs"][0]["steps"]

	

	


	end


	def create
		#timeframe selected
		amount_time = params[:amount_time]
		#people selected
		amount_people = params[:amount_people]
		#amount selected
		amount_spend = params[:amount_spend]

		@user_id = params[:user_id]

		@current_user = User.find(session[:user_id])


		#grab the affairs for the user accessing the route and pass them into a template
		if logged_in? && check_current_user? #this is our definition of logged in
			@current_user = User.find(session[:user_id])

			
			#logic for randomizer
			# @new_array = Adventure.where("timeframe <= ? AND per_person <= ?", amount_time, amount_spend)
			# @new_adventure = @new_array.sample
			# @new_prev_adventure = @new_adventure.prev_adventures

			# puts @new_adventure
			# puts @new_prev_adventure

			redirect_to user_adventure_path(adventure)
		else
				# redirect_to user_path(actual_user)
		end
	end
		


end
