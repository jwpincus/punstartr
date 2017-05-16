require 'rails_helper'

RSpec.feature "user can visit home page" do
  context "as a guest user" do
    it "can see projects" do
      projects = create(:projects, 3)
      project_1 = projects.first
      project_3 = projects.last

      visit root_path

      expect(response).to be_success
      expect(page).to have_content("Puntstartr")
      expect(page).to have_content(project_1.name)
      expect(projects.count).to eq(3)
      expect(page).to have_content(project_3.name)
      expect(page).to have_content(project_3.image)


    end

    xit "can see list of categories in sidebar" do
    end

    xit "can see login/logout link" do
    end

  end

end
