require 'rails_helper'

describe "Users API" do
  it "returns a list of users" do
    user_list = create_list(:user, 3)

    get "/api/v1/users"

    expect(response).to be_success

    users = JSON.parse(response.body)

    expect(users.count).to eq(3)
    expect(users.first["name"]).to eq(user_list.first.name)
    expect(users.first["email"]).to eq(user_list.first.email)
  end
end
