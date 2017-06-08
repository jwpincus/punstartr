class Api::V1::Projects::MostBackersController < ApplicationController

  def index
    render json: Project.most_backers(params[:limit])
  end

end
