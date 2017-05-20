require 'rails_helper'

describe "user can create a project" do
  context "when user is not logged in" do
    it "takes user to login page" do
      visit root_path
      within('.nav-wrapper') do
        click_on "Start a project"

        expect(current_path).to eq login_path
      end
  end

  end

  xit "fill in category and location" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    click_on "Start a new project"

    fill_in 'category', with: 'Art'
    fill_in 'title',    with: 'Crafters Paradise'
    fill_in 'country',  with: 'United States'

    click 'Save and continue'

    expect(current_page).to eq('/:user/projects/crafters-paradise')
  end
end
