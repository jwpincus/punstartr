require 'rails_helper'


RSpec.feature "User views navbar" do

  before :each do
    create(:project)
  end

  scenario "guest user can view and use navbar" do

    visit "/"
    within("div.nav-wrapper") do
      expect(page).to have_content("Log In")
			expect(page).to have_content("Sign Up")
      expect(page).to have_content("All Projects")
			expect(page).to have_content("Categories")
			expect(page).to have_content("Start a project")
    end
  end

  context "as a logged in user" do
    it "should see user name in nav bar" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).
        to receive(:current_user).
        and_return(user)

      visit root_path

      within(".nav-wrapper") do
        expect(page).to have_content(user.name)
      end
    end
  end
end
