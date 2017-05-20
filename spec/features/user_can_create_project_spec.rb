require 'rails_helper'

describe "user can create a project" do
  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  xit "takes user to new page" do
    visit root_path
    within('div.nav-wrapper ul#nav-mobile a.start-project') do
      click_on "Start a project"
    end

    expect(current_page).to eq '/:user/projects/new'
  end

  xit "fill in category and location" do
    
    click_on "Start a new project"

    fill_in 'category', with: 'Art'
    fill_in 'title',    with: 'Crafters Paradise'
    fill_in 'country',  with: 'United States'

    click 'Save and continue'

    expect(current_page).to eq('/:user/projects/crafters-paradise')
  end
end
