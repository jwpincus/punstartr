require 'rails_helper'

describe "Users API" do
  it "returns a list of users" do
    create_list(:user, 3)

    get "/api/v1/users"

    expect(response).to be_success

    users = JSON.parse(response.body)

    expect(users.count).to eq(3)
  end
end
