class Users::ProjectsController < UsersController
  # before_action :user_logged_in?

  def index
    @projects = User.find(params[:user_id]).projects
  end
end
