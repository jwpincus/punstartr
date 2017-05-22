require 'rails_helper'

RSpec.feature "doners can fund projects" do
  context "a logged in user" do
    it "can fund a project" do
      project = create(:project_with_rewards)
      user = create(:user)
      allow_any_instance_of(ApplicationController).
        to receive(:current_user).
        and_return(user)

      binding.pry
      visit project_path(project)
      within(".rewards_list") do
        within(".default_reward") do
          fill_in "Amount", with: 30
          click_on "Fund this project!"
        end
      end

      expect(current_path).to be("/payments")
      click_on "Fund this project"

      expect(current_path).to be(confirmation_page_path)
      within(".confirmation_page") do
        expect(page).to have_content "Thanks for funding #{project.name}!"
        expect(page).to have_content "Your card will be charged $30"
        expect(page).to have_content project.end_date
      end
    end
  end
end
