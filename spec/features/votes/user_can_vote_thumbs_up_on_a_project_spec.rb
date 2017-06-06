require 'rails_helper'

RSpec.feature "as a user" do
  scenario "guest user can view project votes on project page" do
    project = create(:project_with_votes)

    visit project_path(project.id)

    within(".votes_section") do
      expect(page).to have_content("#{project.upvotes} people love this project.")
    end
  end

  scenario "guest user has to log in if she wishes to upvote a project" do
    project = create(:project_with_votes)

    visit project_path(project.id)

    within(".votes_section") do
      expect(page).to have_content("Please log in to support this project with a vote.")
    end
  end

  scenario "logged-in user can upvote a project by clicking the thumbs up icon", :js => true do
    project = create(:project)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit project_path(project.id)

    within(".votes_section") do
      find("#thumbup").click
#ajax call here to create new vote
    end
    expect(user.votes.first.project).to eq(project)
  end

  xscenario "user can remove vote status from a project by clicking on an existing upvote icon" do
    project = create(:project)
    user = create(:user)
    vote = user.votes.create(:vote, project_id: project.id)

    visit root_path
    click_on "Login"

    expect(current_path).to eq(login_path)
    fill_in "username", with: user.email
    fill_in "password", with: user.password
    click_on "submit"

    expect(page).to have_content("Welcome back!")

    visit project_path(project.id)

    within(".votes_section") do
      expect(user.votes.find_by(project.id).vote_type).to eq("upvote")

      click_on "upvote_icon"

      expect(user.votes.find_by(project.id).vote_type).to eq(nil)
    end
  end

end


# As a guest user
# When I visit an individual project page
# I can see a total number of likes on each project as a guest (but will be prompted to log in if i want to vote as a guest user)
# As a logged-in user
# I can "like" the project by clicking the thumbs up icon
# and i can dislike the project by clicking on the thumbs down icon
# I can change my like to a dislike and vice versa
# and I can remove my like or dislike by clicking on it
# and i can see this happen in real-time (ajax)
