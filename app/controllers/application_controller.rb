class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

#working on this, might not use
  before_action :require_login, only: [:edit]
  # before_action :require_login, only: [:edit]

  private

    def not_authenticated
      flash[:warning] = "permission not allowed"
    end


end
