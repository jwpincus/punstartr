class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def not_authenticated
      flash[:warning] = "Please log in to continue!"
      redirect_to login_path
    end
end
