class Projects::RewardsController < ApplicationController
  before_action :require_login, only: [:create]
  def index
    @project = Project.find(params[:project_id])
  end

  def create
    
  end

end
