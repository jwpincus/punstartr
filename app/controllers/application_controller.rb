class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :user_logged_in?

  def user_logged_in?
    if current_user
      true
    else
      redirect_to root_path
    end
  end

  private

    def not_authenticated
      flash[:warning] = "permission not allowed"
    end

end
