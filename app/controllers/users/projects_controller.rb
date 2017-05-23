class Users::ProjectsController < UsersController
  def index
    @projects = current_user.projects
    @rewards = current_user.rewards
  end
end
