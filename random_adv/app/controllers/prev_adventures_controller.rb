class PrevAdventuresController < ApplicationController

	def index
		@prev_adven = Prev_Aventure.find(params[:user_id])
	end


	
end