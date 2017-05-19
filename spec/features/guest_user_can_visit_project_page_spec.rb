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

      expect(page).to have_content(project.target_amount)
      expect(page).to have_content(project.description)
      expect(page).to have_content(project.completion_date)

      expect(page).to have_content("About this project")
      expect(page).to have_content("Support this project")
    end
  end
end
