require 'rails_helper'

describe "user can create a project" do
  attr_reader :image_url, :category, :country, :city, :date, :image_url
  before :each do
    create(:project)
    @category = create(:category)
    @country = create(:country)
    @city = create(:city)
    @image_url =  Faker::Avatar.image
  end
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
    it "displays project in user profile page" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_project_path

      select category.name,                from: 'project_category_id'
      fill_in 'project[title]',            with: 'Crafters Paradise'
      fill_in 'project[description]',      with: 'Lots of paint'
      fill_in 'project[image_url]',        with: image_url
      fill_in 'project[target_amount]',    with: '10000'
      fill_in 'project[city]',             with: 'Paris'
      select country.name,                 from: 'project_country_id'

      click_on 'Save and continue'

      expect(current_path).to eq('/rewards/new')
      fill_in "reward[title]", with: "Raw Denim Romphim"
      fill_in "reward[description]", with: "24 ounce Kahari Mills left-hand twill denim"
      fill_in "reward[pledge_amount]", with: 475
      fill_in "reward[limit]", with: 1

      click_on 'Save and Continue'

      project = Project.last
      expect(project.title).to eq('Crafters Paradise')
      expect(project.owners.count).to eq(1)
      expect(project.owners.first).to eq(user)

      visit user_path(user)

      expect(page).to have_content("Your Puntd Projects")

      within('.user-projects') do
        expect(page).to have_selector('.card', count:1)
        expect(page).to have_content('Crafters Paradise')

        click_on 'Crafters Paradise'
      end

      expect(current_path).to eq(project_path(project))
    end
  end
end
