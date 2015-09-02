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
	    @adv_id = params[:id]
	    @user_id = params[:user_id]
	    @current_adventure = PrevAdventure.where("adventure_id = ? AND user_id = ?", @adv_id, @user_id)
		
		#env variable key and HTTP response for Google API
		api_key = ENV["WING_IT_GOOGLE"]
		
		#for rendering page with their destination directions
		@adventure_choice = Adventure.find(params[:id])
		end_location = @adventure_choice.location
		@hint = @adventure_choice.hints
		@current_user = User.find(params[:user_id])

		#Google API variables to set the request
	    lat = cookies[:lat]
	    long = cookies[:long]
	    mode = @current_adventure.last.mode_of_travel
	    #Google API request
		response = HTTParty.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{lat},#{long}&destination=place_id:#{end_location}&mode=#{mode}&key=#{api_key}")
		@total_duration = response["routes"][0]["legs"][0]["duration"]
		@directions = response["routes"][0]["legs"][0]["steps"]

		client_id = "ucWa1PKE9x4YgQ_xouwuZFHRW1H-gGw9"
    	client_secret = "PrbeliotjJLysW2yDZq2eFqN7cR_YuGTEGcPUmgK"
    	base_url = "https://login.uber.com/oauth/authorize"
    	query ={
        response_type: 'code',
        client_id: client_id,
        scope: 'request'
    	}
    	encoded_query = URI.encode_www_form(query)
    	@url = base_url + "?" + encoded_query

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
