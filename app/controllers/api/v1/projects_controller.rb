class Api::V1::ProjectsController < ApplicationController
  def index
    render json: Project.all
  end
end
