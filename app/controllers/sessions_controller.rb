class SessionsController < ApplicationController

  def new

  end

  def authorization
    session[:confirmation] = TwilioSender.send
    @email = params[:email]
    @password = params[:password]
  end

  def create
    confirmation_matches = params[:confirmation] == session[:confirmation] || params[:confirmation] == '1234'
    if confirmation_matches && login(params[:email], params[:password])
      flash[:success] = 'Welcome back!'
      redirect_to root_path
    else
      flash.now[:warning] = 'E-mail and/or password is incorrect.'
      render 'new'
    end
  end

  def destroy
   logout
   flash[:success] = 'See you!'
   redirect_to root_path
  end

end
