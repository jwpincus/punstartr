class Api::V1::VotesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Vote.all
  end

  def show
    render json: Vote.find(params[:id])
  end

  def create
    vote = current_user.votes.create(vote_params)
    render status: 201, json: {
      message: "Successfully create a vote.",
      vote: vote
    }.to_json
  end

  private

  def vote_params
    params.require(:post).permit(:vote_type, :project_id)
  end

end
