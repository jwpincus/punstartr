class Api::V1::Categories::CountByProjectController < ApplicationController

  def index
    render json: Category.count_by_project
  end

end
