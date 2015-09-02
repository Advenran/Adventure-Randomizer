require "HTTParty"

class AdventuresController < ApplicationController

	def index
		#index not needed
	end

	def new
		@current_user = User.find(session[:user_id])

			#Wunderground weather API
			response = HTTParty.get("http://api.wunderground.com/api/abc3ed8ecb8d84a6/conditions/q/NY/new_york.json")
			temperature = response["current_observation"]["temp_f"]
			weather = response["current_observation"]["weather"]
			@icon = response["current_observation"]["icon_url"]
			@current_forecast = "#{weather} #{temperature} F°"

			@new_prev_adventure = PrevAdventure.new

		if logged_in? && check_current_user?
			@current_user = User.find(session[:user_id])
		else
			redirect_to user_path(actual_user)
		end
	end

	def show
		#env variable key and HTTP response for Google API
		api_key = ENV["WING_IT_GOOGLE"]
		
		#for rendering page with their destination directions
		@adventure_choice = Adventure.find(params[:id])
		end_location = @adventure_choice.location
		@hint = @adventure_choice.hints
		@current_user = User.find(params[:user_id])

		


		
		# @ip = request.remote_ip

	    lat = cookies[:lat]
	    long = cookies[:long]
	    mode = params[:mode_of_travel]

		# mode_of_travel = params[:mode_of_travel]

		response = HTTParty.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{lat},#{long}&destination=place_id:#{end_location}&mode=#{mode}&key=#{api_key}")
		puts "#{response} this is the response ************"
		@total_duration = response["routes"][0]["legs"][0]["duration"]
		@directions = response["routes"][0]["legs"][0]["steps"]
	end


	def create
		#gathering page information
		amount_time = params[:amount_time]
		amount_people = params[:amount_people]
		amount_spend = params[:amount_spend]
		mode_of_travel = params[:mode_of_travel]


		@user_id = params[:user_id]
		@current_user = User.find(session[:user_id])

		if logged_in? && check_current_user? #this is our definition of logged in
			@current_user = User.find(session[:user_id])
			redirect_to user_adventure_path(adventure)
		else
			redirect_to user_path(actual_user)
		end
	end
		


end
