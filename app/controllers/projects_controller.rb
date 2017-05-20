class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end

  def new
    if current_user
      @project = Project.new
    else
      render login_path
    end
  end
end
