require 'rails_helper'

RSpec.feature "As a logged-in user" do
  scenario "they can add a comment to a project" do
skip
    project = create(:project)
    user = create(:user)
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user)
      .and_return(user)

    visit '/'

    first('.card-content').click_on(project.title)

    expect(current_path).to eq(project_path(project))
    expect(page).to have_content('Comments')

    within('#comments-list') do
      expect(page).to have_content('')
    end

    fill_in 'comment[body]', with: 'This project is rad.'

    click_on 'Submit Comment'

    visit '/'
    first('.card-content').click_on(project.title)
    expect(current_path).to eq(project_path(project))

    comment = Comment.last

    expect(comment.body).to eq('This project is rad.')

    within('.comments-list') do
      expect(page).to have_content(comment.body)
    end

  end
end
