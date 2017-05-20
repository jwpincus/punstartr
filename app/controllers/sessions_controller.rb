class SessionsController < ApplicationController

  def new
  end

  def destroy
    session[:user_id] = nil
  end

end
