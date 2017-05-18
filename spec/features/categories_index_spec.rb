require 'rails_helper'

describe "As a user" do
  context "When I visit the root path and click categories in Navbar" do
    it "I expect to be taken to the categories index and see navbar" do
      visit '/'
      click_on "Categories"
      expect(current_path).to eq('/categories')
      expect(page).to have_css("div.nav-wrapper")
    end
    it 'I expect to see a list of category names' do
      category_1, category_2 = create_list(:category, 2)
      visit '/categories'
      expect(page).to have_css('a.categories')
      expect(page).to have_selector(:link_or_button, category_1.name)
      expect(page).to have_selector(:link_or_button, category_2.name)
    end
    it "I expect to see three projects from each category" do
      category_1, category_2 = create_list(:category, 2)
      visit '/categories'
      save_and_open_page
      within("div.#{category_1.name}") do
        expect(page).to have_selector('card', 3)
      end
    end
  end
end



# As a guest user
# when I visit the root path
# and I click on the Categories button in the navbar
#
# I expect to be taken the categories index
#
# I expect to see the navbar
# I expect to see a list of category names such as "Art",  "Film", "Technology", etc.
# I expect each category name to be a clickable link to the show page for that category
