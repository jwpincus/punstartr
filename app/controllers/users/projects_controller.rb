class Users::ProjectsController < UsersController
  before_action :require_login, only: [:new]

  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  
end
