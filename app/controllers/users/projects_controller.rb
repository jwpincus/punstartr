class Users::ProjectsController < UsersController
  def index
    @user = current_user if current_user.id == params[:user_id].to_i
    @projects = current_user.projects
    @rewards = current_user.rewards
  end
end
