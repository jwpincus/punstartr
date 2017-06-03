require 'rails_helper'

describe "As a user" do

  before :each do
    create(:project)
  end

  context "When I visit the root path and click categories in Navbar" do
    it "I expect to be taken to the categories index and see navbar" do
      visit '/'

      within(:css, "nav") do
        click_on 'Categories'
      end

      click_on "All Categories"

      expect(current_path).to match(/categories/)
      expect(page).to have_css("div.nav-wrapper")
    end
    it 'I expect to see a list of category names in the navbar on every page' do
      category_1, category_2 = create_list(:category, 2)

      visit '/'

      find('.dropdown-button').click

      expect(page).to have_selector(:link_or_button, category_1.name)
      expect(page).to have_selector(:link_or_button, category_2.name)
      expect(page).to have_selector(:link_or_button, "All Categories")

      visit '/categories'

      find('.dropdown-button').click

      expect(page).to have_selector(:link_or_button, category_1.name)
      expect(page).to have_selector(:link_or_button, category_2.name)
      expect(page).to have_selector(:link_or_button, "All Categories")
    end
    it "I expect to see three projects from each category" do
      category_1, category_2 = create_list(:category, 2)
      category_1.projects << create_list(:project, 4)
      category_2.projects << create_list(:project, 4)
      visit '/categories'
      within("div.#{category_1.name}") do
        expect(page).to have_selector('div.card', count: 4)
      end
    end
  end
end
