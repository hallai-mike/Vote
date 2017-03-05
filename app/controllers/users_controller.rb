class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  # Create a new user
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome"
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

end
