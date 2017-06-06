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

    post "/api/v1/votes?vote_type=upvote&user_id=#{user.id}&project_id=#{project.id}"

    expect(response.code).to eq("201")

    vote = JSON.parse(response.body)

    expect(vote).to be_a(Hash)
    expect(vote["vote"]["vote_type"]).to eq("upvote")
  end
# can create one vote by its id
# can update one vote by its id
# can delete one vote by its id
end
