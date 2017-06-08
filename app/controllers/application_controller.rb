class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def not_authenticated
      flash[:warning] = "Please log in to continue!"
      redirect_to login_path
    end

    def check_project_owner(project)
      redirect_page_not_found unless current_user.owner?(project)
    end

    def redirect_page_not_found
      flash[:alert] = "Page not found!"
      render :file => 'public/404.html', :status => :not_found
    end
end
