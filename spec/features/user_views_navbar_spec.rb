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

  scenario "as a logged in user" do
    it "should see user name in nav bar" do
      user = create(:user)
      login(user)

      expect

    end
  end
end
