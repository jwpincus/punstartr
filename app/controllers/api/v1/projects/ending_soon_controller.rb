class Api::V1::Projects::EndingSoonController < ApplicationController

  def index
    render json: Project.ending_soon(params[:limit])
  end

end
