require "HTTParty"

module Wunderground
	
	def get_weather
		HTTParty.get("api")
	end





end