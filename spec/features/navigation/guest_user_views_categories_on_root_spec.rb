require 'rails_helper'

RSpec.feature "As a guest user" do

  before :each do
    create(:project)
  end

  context "they can view categories" do
    it "can see a list of categories on the right side of the page" do
      category1, category2 = create_list(:category, 2)

      visit root_path

      within("div.categories") do
        expect(page).to have_content("Categories")
        expect(page).to have_selector(:link_or_button, category1.name)
        expect(page).to have_selector(:link_or_button, category2.name)
      end
    end
  end
end
