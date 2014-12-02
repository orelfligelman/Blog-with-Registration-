class UsersController < ApplicationController
	before_action :check_login, :only => [:index]

	def index
	end

	def show
	end

	def new
		@user = User.new
	end

	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end


	def create
		@user = User.new(user_params)

		if @user.save
			flash[:status] = TRUE
			flash[:alert] = "Congo! You have successfully registered .. "
		else
			flash[:status] = FALSE
			flash[:alert] = @user.errors.full_messages
		end
		redirect_to register_path
	end
end
