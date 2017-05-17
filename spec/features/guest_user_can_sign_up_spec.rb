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

      expect(current_path).to be(dashboard_path)
      expect(page).to have("welcome to Puntstartr, User Name")

    end
  end
end


# as a guest user
# when I visit `/signup`
#
# I expect to see "sign up"
# I expect to see a text field for ["name", "email", "email confirmation", "password","password confirmation"]
#
# And when I fill those fields in with valid information
#
# I expect to be on `dashboard_path`
# i expect to see "welcome to puntstartr, user.name"