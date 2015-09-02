require "HTTParty"

module Wunderground
	
	def get_weather
		HTTParty.get("api")
		temperature = blah
	end
	
end