require 'rails_helper'

describe "votes api" do
  it "can return a list of votes" do
    create_list(:vote, 4)

    get "/api/v1/votes"

    expect(response).to be_success

    votes = JSON.parse(response.body)

    expect(votes).to be_an(Array)
    expect(votes.first).to have_key("vote_type")
    expect(votes.first).to have_key("user_id")
    expect(votes.first).to have_key("project_id")
  end

  it "can return a vote by its id" do
    vote1 = create(:vote)
    vote2 = create(:vote)

    get "/api/v1/votes/#{vote1.id}"

    vote = JSON.parse(response.body)

    expect(response).to be_success

    expect(vote["id"]).to eq(vote1.id)
    expect(vote).to have_key("vote_type")
    expect(vote).to have_key("user_id")
    expect(vote).to have_key("project_id")
  end

  it "can create a vote" do
    user = create(:user)
    project = create(:project)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    vote_params = { vote_type: "upvote", project_id: project.id }

    post "/api/v1/votes", params: { post: vote_params}

    expect(response.code).to eq("201")

    vote = JSON.parse(response.body)

    expect(vote).to be_a(Hash)
    expect(vote["vote"]["vote_type"]).to eq("upvote")
    expect(vote["vote"]["project_id"]).to eq(project.id)
    expect(vote["vote"]["user_id"]).to eq(user.id)
  end

  it "can delete a vote" do
    user = create(:user)
    project = create(:project)
    vote = create(:vote, user_id: user.id, project_id: project.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    expect(Vote.count).to eq(1)

    delete "/api/v1/votes/#{vote.id}"

    expect(response.code).to eq("204")
    expect(Vote.count).to eq(0)
    expect{ Vote.find(vote.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
