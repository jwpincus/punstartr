class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def update
    current_user.update_attributes(api_params)
  end

  private
  def api_params
    params.permit(:name, :phone, :email)
  end
end
