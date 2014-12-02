class UsersController < ApplicationController
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
			flash[:alert] = "Hooray"
		else
			flash[:status] = FALSE
			flash[:alert] = @user.errors.full_messages
		end
		redirect_to register_path
	end
end
