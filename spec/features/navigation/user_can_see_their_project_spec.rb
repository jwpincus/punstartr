require 'rails_helper'

describe 'A user that owns projects' do
  context 'the user is logged in' do
    it 'they can see their own projects' do
      user = create(:user_with_projects)
      user2 = create(:user_with_projects)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit "/users/#{user.id}/projects"
      within("body") do
        expect(page).to have_selector('div.card', count: 2)
        expect(page).to have_content(user.projects.first.title)
        expect(page).to have_css("img[src*='#{user.projects.first.image_url}']")
        expect(page).to have_css("a[href*='#{project_path(user.projects.first)}']")
        expect(page).to have_no_content(user2.projects.first.title)
      end
    end
  end
end
