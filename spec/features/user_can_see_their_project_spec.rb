require 'rails_helper'

describe 'A user that owns projects' do
  context 'the user is logged in' do
    it 'they can see their own projects' do
      user = create(:user_with_projects)
      user2 = create(:user_with_projects)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit "user/#{user.id}/projects"
      within("body") do
        expect(page).to have_selector('div.project', count: 2)
        expect(page).to have_content(user.projects.first.title)
        expect(page).to have_css("img[src*='#{user.projects.first.image_url}']")
        expect(page).to have_css("a[href*='#{project_page(user.projects.first)}']")
        expect(page).to have_no_content(user2.projects.first.title)
      end
    end
  end
end
# test setup:
# projects for user 1
# projects for user 2
# as logged in user 1
# when I visit /user/:id/projects
# I expect to see all of my projects
# I expect to see the project image
# I expect to see the project name
# I expect to see a link to each project show page
# I expect to NOT see any of user 2's projects
