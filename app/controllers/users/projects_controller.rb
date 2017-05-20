class Users::ProjectsController < UsersController

  def index
    if current_
    @projects = current_user.projects
  end
end
