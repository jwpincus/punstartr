require 'rails_helper'

describe "user can create a project" do
  before do
    # As a logged in user,
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  it "takes user to new page" do
    # WHEN I click on start a new project
    click_on "Start a project"
    # EXPECT to be taken to /:user/projects/new
    expect(current_page).to eq '/:user/projects/new'
  end

  it "fill in category and location" do
    click_on "Start a new project"

    fill_in 'category', with: 'Art'
    fill_in 'title',    with: 'Crafters Paradise'
    fill_in 'country',  with: 'United States'

    click 'Save and continue'

    expect(current_page).to eq('/user/projects/crafters-paradise')
  end
end
