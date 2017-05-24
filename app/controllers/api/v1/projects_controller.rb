class Api::V1::ProjectsController < ApplicationController
  def index
#    render json: Project.all
    @projects = Project.all
  end
end
