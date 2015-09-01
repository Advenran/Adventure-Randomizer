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
			@current_forecast = "#{weather} | #{temperature}° F" 
			# to test
			puts "the current weather for your adventure is #{weather} and #{temperature}"



		if logged_in? && check_current_user? #this is our definition of logged in
			@current_user = User.find(session[:user_id])
			#below is the code to generate a random adventure

		else
				# redirect_to user_path(actual_user)
		end

		@adventure = Adventure.new


	end

	def show

		adventure_choice = params[:id]

		response = HTTParty.get("https://maps.googleapis.com/maps/api/directions/json?origin=place_id:ChIJaQ2FO55ZwokRKYAlmF0IlzA&destination=place_id:ChIJa1QZIAJZwokRySwnNKYyMno&key=AIzaSyAHag6dnSTJnXF7Kg-le6dNEqsTVZesl_o")

		@directions = response["routes"][0]["legs"][0]["steps"]

		puts adventure_choice

	


	end


	def create
		#timeframe selected
		amount_time = params[:amount_time]
		#people selected
		amount_people = params[:amount_people]
		#amount selected
		amount_spend = params[:amount_spend]
		#adventure.where({})
		adventure_choice = Adventure.where(":timeframe < ?", 150)

		puts adventure_choice


		#grab the affairs for the user accessing the route and pass them into a template
		if logged_in? && check_current_user? #this is our definition of logged in
			@current_user = User.find(session[:user_id])
		else
				# redirect_to user_path(actual_user)
		end
	end
		


end
