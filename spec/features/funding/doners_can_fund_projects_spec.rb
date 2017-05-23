require 'rails_helper'

RSpec.feature "doners can fund projects" do
  context "a logged in user" do
    it "can fund a project" do
      project = create(:project_with_rewards)
      user = create(:user)
      allow_any_instance_of(ApplicationController).
        to receive(:current_user).
        and_return(user)

      visit project_path(project)

      click_on("Back this project")

      expect(current_path).to match(/#{project.id}\/rewards/)

      within(".rewards_list") do
          click_on "Continue", match: :first
      end

      expect(current_path).to match(/checkout/)
      click_on "Confirm Pledge"
      expect(current_path).to eq(confirmation_path)
      within(".confirmation_page") do
        expect(page).to have_content "Thanks for funding #{project.title}!"
        expect(page).to have_content "Your card has been charged $"
        expect(page).to have_content(/\$[,\d]+/)
      end
    end
  end
end
