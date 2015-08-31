require "HTTParty"

class AdventuresController < ApplicationController

	include HTTParty

	def new
		#Wunderground weather API
		response = HTTParty.get("http://api.wunderground.com/api/abc3ed8ecb8d84a6/conditions/q/NY/new_york.json")
		temperature = response["current_observation"]["temp_f"]
		weather = response["current_observation"]["weather"]
		icon = response["current_observation"]["icon_url"]
		current_forecast = "the current weather for your adventure is #{weather} and #{temperature}!"
		# to test
		puts "the current weather for your adventure is #{weather} and #{temperature}F!"

		@adventure = Adventure.new

	end


end