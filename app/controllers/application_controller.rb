class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      session.clear
    return
  end

  def user_logged_in?
    if current_user
      true
    else
      redirect_to root_path
    end
  end
end
