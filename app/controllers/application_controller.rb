class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def not_authenticated
      flash[:warning] = "permission not allowed"
    end
end
