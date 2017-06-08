class CollaboratorsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @collaborator = @project.owners.new
  end

  def create
    @project = Project.find(params[:project_id])

    if user = User.find_by(email: params[:user][:email])
      flash[:success] = "Email sent to #{user.name}"
      AddCollaboratorMailer.inform(user, current_user, @project).deliver_now

      # @project.owners << User.find_by(email: params[:user][:email])
    else
      flash[:error] = "This email does not match any registered users"
    end

    redirect_to project_path(@project)
  end
end
