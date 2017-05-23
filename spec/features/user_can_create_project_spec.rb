require 'rails_helper'

describe "user can create a project" do
  context "when a user is logged in" do
    it "takes user to new project page" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit root_path
      within('.nav-wrapper') do
        click_on "Start a project"

        expect(current_path).to eq new_project_path
      end
    end
  end

  it "fill in category and location" do
    category = create(:category)
    country = create(:country)
    user = create(:user)
    image_url =  Faker::Avatar.image
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_project_path

    fill_in 'project[category]',         with: category.name
    fill_in 'project[title]',            with: 'Crafters Paradise'
    fill_in 'project[description]',      with: 'Lots of paint'
    fill_in 'project[image_url]',        with: image_url
    fill_in 'project[target_amount]',    with: '10000'
    fill_in 'project[completion_date]',  with: '12/12/2020'
    fill_in 'project[country]',          with: country.name

    click_on 'Save and continue'

    expect(current_path).to eq('/projects/1')
    expect(page).to have_content('Crafters Paradise')
    expect(page).to have_content('Lots of paint')
    expect(page).to have_css("img[src*='#{image_url}']")
    expect(page).to have_content('$10,000')
    expect(page).to have_content('December 12, 2020')
  end
end
