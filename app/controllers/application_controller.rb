class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :set_chat_id

  def set_chat_id(user_id)
    cookies.signed[:user_id] = user_id
  end

  private
    def not_authenticated
      flash[:warning] = "Please log in to continue!"
      redirect_to login_path
    end
end
