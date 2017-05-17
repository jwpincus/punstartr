require 'rails_helper'

RSpec.feature "user can visit home page" do
  context "as a guest user" do
    it "can see projects" do
      projects = create_list(:project, 3)
      project_1 = projects.first
      project_3 = projects.last

      visit root_path

      expect(page).to have_content("Puntstartr")
      expect(page).to have_content(project_1.title)
      expect(projects.count).to eq(3)
      expect(page).to have_content(project_3.title)
      expect(page).to have_css("img[src*='#{project_1.image_url}']")


    end

    xit "can see list of categories in sidebar" do
    end

    xit "can see login/logout link" do
    end

  end

end
