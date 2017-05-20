class Users::ProjectsController < UsersController

  def index
    @projects = current_user.projects
  end
end
