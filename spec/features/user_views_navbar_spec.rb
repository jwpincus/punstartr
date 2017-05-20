require 'rails_helper'


RSpec.feature "User views navbar" do
  scenario "guest user can view and use navbar" do

    visit "/"
    within("div.nav-wrapper") do
      expect(page).to have_content("Log In")
			expect(page).to have_content("Sign Up")
			expect(page).to have_content("Categories")
			expect(page).to have_content("About Us")
			expect(page).to have_content("Start a Project")
    end
  end

  context "as a logged in user" do
    it "should see user name in nav bar" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      within(".nav-wrapper") do
        expect(page).to have_content(user.name)
      end
    end

    xit "should be able to log out" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      expect(page).to have_content(user.name)

      within(".nav-wrapper") do
        save_and_open_page
        click_on "Log out"
      end

      within(".nav-wrapper") do
        expect(page).to_not have_content("Log out")
      end
    end
  end
end
