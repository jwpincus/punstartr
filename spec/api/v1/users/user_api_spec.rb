require 'rails_helper'

describe "API route" do
  it "/api/v1/users/ update" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    patch "/api/v1/user?name=Jack&email=reset@email.com&phone=123456789"
    expect(user.name).to eq('Jack')
    expect(user.email).to eq('reset@email.com')
    expect(user.phone).to eq('123456789')
    expect(response.status).to eq(204)
  end
end
