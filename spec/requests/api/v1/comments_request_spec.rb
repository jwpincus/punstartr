require 'rails_helper'

describe "Comment API" do
  it "displays a list of comments" do
    comment_1, comment_2, comment_3 = create_list(:comment, 3)

    get '/api/v1/comments'

    expect(response).to be_success

    comments = JSON.parse(response.body)

    expect(comments.count).to eq(3)
  end

  it "creates a new comment" do
    project = create(:project)
    user = create(:user)
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user)
      .and_return(user)

    comment_params = { project_id: project.id, body: "This project is rad." }

    post "/api/v1/comments", params: { comment: comment_params }

    comment = Comment.last

    assert_response :success
    expect(response).to be_success
    expect(Comment.count).to eq(1)
    expect(comment.body).to eq("This project is rad.")
    expect(comment.user).to eq(user)
    expect(comment.project).to eq(project)
  end
end
