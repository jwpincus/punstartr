class Api::V1::Projects::MostFundedController < ApplicationController

  def index
   render json: Project.most_funded_list
  end
end
