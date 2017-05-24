require 'rails_helper'

describe "user can create a project" do
  context "when a user is logged in" do
    it "takes user to new project page" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit root_path
      within('.nav-wrapper') do
        click_on "Start a project"

        expect(current_path).to eq new_project_path
      end
    end
  end
end
