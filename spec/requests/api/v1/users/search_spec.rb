require 'rails_helper'

describe "find a user by params" do
  it "can find a user by name param" do
    @user = create(:user)
    
    get "/api/v1/users/search", params: {name: @user.name}
      
    expect(response.status).to eq(200)

    user_json = JSON.parse(response.body)

    expect(user_json["name"]).to eq(@user.name)
  end
end
