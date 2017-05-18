require 'rails_helper'

describe "As a user" do
  context "When I visit the root path and click categories in Navbar" do
    it "I expect to be taken to the categories index" do
      visit '/'
      click_on "Categories"
      expect(current_path).to eq('/categories')
      expect
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
