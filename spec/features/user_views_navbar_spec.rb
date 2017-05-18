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

  scenario "logged in user see's name in navbar" do
    

  end
end
