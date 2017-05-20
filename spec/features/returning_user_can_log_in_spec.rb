require 'rails_helper'

RSpec.feature "returning user can log in" do
  xfeature "an existing user can log in" do
    it "logs in successfully" do

      user = create(:user)

      visit login_path

      fill_in "Email", with: user.email
      fill_in "Password", with: "password"

      within(".nav-wrapper") do
        expect(page).to have_content(user.name)
      end
    end
  end
end
