class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(params[:user][:email], params[:user][:password])
      flash[:success] = "You have signed up!"
      redirect_to root_path
    else
      flash[:warning] = "Please fill out all fields"
      redirect_to signup_path
    end
  end




  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :phone)
    end
end
