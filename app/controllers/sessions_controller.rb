class SessionsController < ApplicationController
	def new
	end
	def create
		#validate the user has been authenticated by comparing his input to his name and password

		user = User.validate_login(
				params[:session][:name],
				params[:session][:password]
		)

# if the user is valid,
#1) assign him a session id based on his user id
#2) Send him to the users controller
		if user
			session[:user_id] = user.id
			redirect_to :controller => 'users'
			#If user is invalid
			#1 tell him hes invalid
			#2 send him back to the login screen
		else
			flash[:status] = FALSE
			flash[:alert] = "Invalid username or password..."
			redirect_to login_path
		end
	end

#The sessions controller handles login as well as logout. Here we handle the logout.
#1) set the session object value to nil
#2) send him to the login screen

	def destroy
		session[:user_id] = nil
		redirect_to login_path
	end
end
