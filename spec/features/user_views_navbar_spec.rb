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

  describe "as a logged in user" do
    it "should see user name in nav bar" do
      visit signup_path
      fill_in "Name", with: "mark"
      fill_in "Email", with: "m@m.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Create account"

      

      within(".dropdown-button") do
        expect(page).to have_content("mark")
      end
    end
  end
end
