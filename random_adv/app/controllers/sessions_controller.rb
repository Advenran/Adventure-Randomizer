class SessionsController < ApplicationController
	include HTTParty
	def new
	end

	def create
		#logged in means a user_id is stored in a session
		user = User.find_by({email: params[:email]})
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id

			def success(pos)
				crd = pos.coords;

				puts 'Your current position is:'
				puts 'Latitude : ' + crd.latitude
				puts 'Longitude: ' + crd.longitude
				puts 'More or less ' + crd.accuracy + ' meters.'
			end

			def error(err)
			  puts warn('ERROR(' + err.code + '): ' + err.message);
			end

			# navigator.geolocation.getCurrentPosition(success, error, options);


			redirect_to new_user_prev_adventure_path(user)
		else
			redirect_to sessions_new_path
		end
	end
	
	#logs out user. removes user_id's from session
	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end

end