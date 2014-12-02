class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	def check_login
		if !session[:user_id]
			flash[:status] = FALSE
			flash[:alert] = "You need to be login first."
			redirect_to login_path
		else
			@user = User.find(session[:user_id])
			$user_name = @user.name
		end
	end
end
