require 'rails_helper'

feature "project edit" do
  let(:user1) {create(:user_with_a_project)}
  let(:project) {user1.projects.first}
  let(:user2) {create(:user)}
  context "from user profile page" do
    scenario "user can edit their own projects" do
      # as a user
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(user1)
      # when I am on my profile
      visit user_path
      # and I click on the edit button for a project
      within('.user-projects') do
        expect(page).to have_selector('project', count: 1)
        expect(page).to have_link('Edit')
        click_link 'Edit'
      end
      # I am brought to the project edit page
      expect(current_path).to eq(edit_project_path(project))
      # and I make a change to the project description
      fill_in :title, with: "RuPaul is Awesome!"
      click_on 'Submit'
      # I am brought to the project's show page
      expect(current_path).to eq(project_path(project))
      # and the change is there
      expect(project.title).to_not eq("RuPaul is Awesome!")
      expect(page).to have_content("RuPaul is Awesome!")
      expect(page).to_not have_content(project.title)
    end
    xscenario "user cannot edit a project they don't own" do
      # as another user
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(user2)
      # when I am on my profile page
      visit user_path
      # i do not see the link for the other user's project
      within('.user-projects') do
        expect(page).to_not have_selector('project')
        expect(page).to_not have_link('Edit')
      end
      # when I visit the edit page anyway
      visit edit_project_path(project)
      # i receive a 404 error
      expect(page.status).to eq(404)
      expect(page).to have_content("Page Not Found")
    end
  end
  context "from project show page" do
    xscenario "user can edit their own project" do
      # as a user
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(user1)
      # when I am on one of my project's show pages
      visit project_path(project)
      # i see an edit button
      expect(page).to have_link('Edit Project')
      # and I click on the edit button
      click_link 'Edit Project'
      # i am brought to the projects edit page
      expect(current_path).to eq(edit_project_path(project))
    end
    xscenario "user cannot see the edit button" do
      # as another user
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(user2)
      # when I am on a project's show page that i don't own
      visit project_path(project)
      # i do not see an edit button
      expect(page).to_not have_link('Edit Project')
    end
  end
end
