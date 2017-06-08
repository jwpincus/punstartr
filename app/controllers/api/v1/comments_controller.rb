class Api::V1::CommentsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    render json: Comment.all
  end

  def create
    comment = current_user.comments.create(comment_params)
    render status: 201, json: {
      message: "Successfully created a comment.",
      comment: comment
    }.to_json
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :project_id)
    end

end
