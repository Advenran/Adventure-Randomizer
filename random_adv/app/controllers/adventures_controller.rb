require "HTTParty"

class AdventuresController < ApplicationController

	include HTTParty

	def new
		actual_user = User.find(session[:user_id])
		@current_user = User.find(session[:user_id])
			#Wunderground weather API
			response = HTTParty.get("http://api.wunderground.com/api/abc3ed8ecb8d84a6/conditions/q/NY/new_york.json")
			temperature = response["current_observation"]["temp_f"]
			weather = response["current_observation"]["weather"]
			icon = response["current_observation"]["icon_url"]
			@current_forecast = "the current weather for your adventure is #{weather} and #{temperature}!"
			# to test
			puts "the current weather for your adventure is #{weather} and #{temperature}F!"



		if logged_in? && check_current_user? #this is our definition of logged in
			@current_user = User.find(session[:user_id])
			#below is the code to generate a random adventure
		else
				# redirect_to user_path(actual_user)
		end

		@adventure = Adventure.new


	end

	def create
		#timeframe selected
		timeframe = body[:amount_time]
		#budget selected
		#people selected
		@adventure_choice = Adventure.where({})



		#grab the affairs for the user accessing the route and pass them into a template
		if logged_in? && check_current_user? #this is our definition of logged in
			@current_user = User.find(session[:user_id])
		else
				# redirect_to user_path(actual_user)
		end
	end
		


end
