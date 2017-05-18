require "rails_helper"

RSpec.feature "As a guest user" do
  context "they can click on project" do
    it "and can visit project page" do
      project = create(:project)

      visit root_path

      click_link project.title

      expect(current_path).to eq(project_path(project))
      expect(page).to have_content("Log In")
      expect(page).to have_content("Sign Up")

      expect(page).to have_content(project.title)
      expect(page).to have_css("img[src*='#{project.image_url}']")
      expect(page).to have_content(project.description)

      expect(page).to have_content("About this project")
      expect(page).to have_content("Support this project")  
    end
  end
end
# As a guest user
# when I visit root 
# and I click on a project
# then I expect the path to be a the name of the project (slug)
# I expect to see the navbar
# I expect to see project image
# I expect to see project title
# I expect to see project description
# I expect to see funding info
# I expect to see rewards