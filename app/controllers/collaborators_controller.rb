class CollaboratorsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @collaborator = @project.owners.new
  end

  def create
    @project = Project.find(params[:project_id])
    @project.owners << User.find_by(email: params[:user][:email])
    redirect_to project_path(@project)
  end
end