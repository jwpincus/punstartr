require 'rails_helper'

RSpec.feature 'user adds a collaborator to a project' do
    let!(:user1) {create(:user_with_a_project)}
    let!(:project) {user1.projects.first}
    let!(:user2) {create(:user)}
    let!(:user2_email) { user2.email }

  scenario 'adds existing user' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    visit project_path(project)

    click_on "Add Collaborator"
    expect(current_path).to eq("/projects/#{project.id}/collaborators/new")

    fill_in 'user[email]', with: user2_email
    click_on "Add Collaborator"

    expect(current_path).to eq(project_path(project))
    expect(project.owners).to eq([user2, user1])
  end
end
