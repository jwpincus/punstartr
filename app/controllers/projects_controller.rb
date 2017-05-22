class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @category = Category.find_by(name: params[:project][:category])
    @country = Country.find_by(name: params[:project][:country])
    @project = current_user.projects.new(project_params)
    if @project.save
      byebug
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  private
    def project_params
      params.require(:project)
      .permit(:title)
      .merge(category_id: @category.id, country_id: @country.id)
    end
end
