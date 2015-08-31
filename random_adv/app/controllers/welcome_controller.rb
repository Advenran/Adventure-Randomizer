class WelcomeController < ApplicationController
	def index
		redirect_to '/sessions/new'
	end
end