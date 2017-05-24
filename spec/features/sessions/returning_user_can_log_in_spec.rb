require 'rails_helper'

RSpec.feature "returning user can log in" do

  before :each do
    create(:project)
  end

  feature "an existing user can log in" do
    it "logs in successfully" do

      user = create(:user)

      visit login_path

      fill_in "Email", with: user.email
      fill_in "Password", with: "password"

      within(".login_form_container") do
        click_on "Log In"
      end
      last_message = FakeSMS.messages.last
      fill_in "confirmation", with: last_message[:from][:body]
      within(".Confirm_form_container") do
        click_on "Log In"
      end


      within(".nav-wrapper") do
        expect(page).to have_content(user.name)
      end
    end
  end

  feature "a logged in user" do
    it "can log out" do
      user = create(:user)

      visit login_path

      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      within(".login_form_container") do
        click_on "Log In"
      end
      last_message = FakeSMS.messages.last
      fill_in "confirmation", with: last_message[:from][:body]
      within(".Confirm_form_container") do
        click_on "Log In"
      end

      expect(page).to have_content(user.name)

      within(".nav-wrapper") do
        click_on "Log out"
      end

      within(".nav-wrapper") do
        expect(page).to_not have_content("Log out")
      end
    end
  end
end
