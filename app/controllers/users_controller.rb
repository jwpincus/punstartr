class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]
      session[:id] = @user.id
      redirect_to dashboard_path
    else
      flash[:warning] = "try again"
      redirect_to signup_path
    end
  end

  def index

  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
