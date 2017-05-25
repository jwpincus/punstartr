class Api::V1::Users::UsersSearchController < ApplicationController
  def show
    render json: User.find_by(search_params)
  end

  private

  def search_params
    params.permit(:name)
  end
end
