class ProjectsController < ApplicationController

  before_action :require_login, only: [:new]

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
      redirect_to new_reward_path(@project)
    else
      redirect_to new_project_path
      flash[:warning] = "Please fill in all fields."
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  private
    def project_params
      params.require(:project)
      .permit(:title, :description, :image_url, :target_amount,:completion_date)
      .merge(category_id: @category.id, country_id: @country.id)
    end
end
