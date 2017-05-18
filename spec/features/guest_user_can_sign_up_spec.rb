require 'rails_helper'

RSpec.feature "as a guest user" do
  context "when visiting /signup" do
    it "can create account" do
      visit signup_path

      fill_in "Name", with: "User Name"
      fill_in "Email", with: "user@user.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"

      click_on "Create account"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Puntstartr")

    end
  end
end
