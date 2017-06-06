class Api::V1::VotesController < ApplicationController

  def index
    render json: Vote.all
  end

  def show
    render json: Vote.find(params[:id])
  end

  def create
    vote = User.find(params[:user_id]).votes.create(vote_params)
    render status: 201, json: {
      message: "Successfully create a vote.",
      vote: vote
    }.to_json
  end

  private

  def vote_params
    params.permit(:vote_type, :project_id)
  end

end
