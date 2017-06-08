require 'rails_helper'

RSpec.feature "As a guest user" do

  before :each do
    create(:project)
  end

  context "they can view categories" do
    it "can see a list of categories on the right side of the page" do
      category1, category2 = create_list(:category, 2)

      visit root_path

      expect(page).to have_css(".owl-carousel")
    end
  end
end
