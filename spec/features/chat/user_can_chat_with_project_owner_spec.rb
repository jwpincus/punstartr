require 'rails_helper'

describe "chat" do
  it "logged in user can initiate chat" do
    project = create(:project)
    user_1 = create(:user)
    user_1.projects << project
    user_2 = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)
    visit project_path(project)
    click_on "Chat with Project Owner"

    expect(current_path).to eq("/chatrooms/1")

  end
end
