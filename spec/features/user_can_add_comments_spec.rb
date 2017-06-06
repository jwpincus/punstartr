require 'rails_helper'

# As a logged-in user
# When I visit the home page
# And I click on the first project
# Then I should see a header for comments
# And I should see no comments yet
# And when I click on "Add a Comment"
# And I fill in the form with a message "This project is rad."
# And I click "Submit Comment"
# Then I should see my comment displayed on the page without reloading


# Additional details: username, time posted (or since posted), index of comments, comments in order of most recently posted, badge for creator, total number of comments, sad path for users not logged in

RSpec.feature "As a logged-in user" do
  scenario "they can add a comment to a project" do

    project = create(:project)
    user = create(:user)
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user)
      .and_return(user)

    visit '/'

    first('.card-content').click_on(project.title) # might need to interpolate here

    expect(current_path).to eq(project_path(project))
    expect(page).to have_content('Comments')

    within('.comments-list') do
      expect(page).to have_content('') # does this test the thing?
    end

    click_on 'Add a Comment'

    fill_in 'comment[body]', with: 'This project is rad.'

    click_on 'Submit Comment'

    expect(current_path).to eq(project_path(project)) # Shouldn't need this but 1st iteration is w/ reload
    expect(comment.body).to eq('This project is rad.')

    within('.comments-list') do
      expect(page).to have_content(comment.body) # might need to interpolate here
    end

    # How do I test for no page reload?
  end
end
