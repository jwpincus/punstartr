require 'rails_helper'

RSpec.feature "as a user" do
  xscenario "guest user can view project votes on project page" do
    project = create(:project_with_votes, 4)

    visit project_path(project.id)

    within(".votes_section") do
      expect(page).to have_content("#{project.votes.count} people love this project.")
    end
  end

  xscenario "guest user has to log in if she wishes to upvote a project" do
    project = create(:project_with_votes, 4)

    visit project_path(project.id)

    within(".votes_section") do
      click_on "upvote_icon"

      expect(page).to have_content("Please log in or register first to support this project with an upvote.")

      click_on "downvote_icon"
      expect(page).to have_content("Please log in or register first to downvote this project.")
    end
  end

  xscenario "logged-in user can upvote a project by clicking the thumbs up icon" do
    project = create(:project)
    user = create(:user)

    visit root_path
    click_on "Login"

    expect(current_path).to eq(login_path)
    fill_in "username", with: user.email
    fill_in "password", with: user.password
    click_on "submit"

    expect(page).to have_content("Welcome back!")

    visit project_path(project.id)

    within(".votes_section") do
      click_on "upvote_icon"

      expect(user.votes.projects.find_by(project.id).id).to eq(project.id)
      expect(user.votes.projects.find_by(project.id).vote_type).to eq("upvote")
    end
  end

  xscenario "user can downvote a project by clicking the thumbs down icon" do
    project = create(:project)
    user = create(:user)

    visit root_path
    click_on "Login"

    expect(current_path).to eq(login_path)
    fill_in "username", with: user.email
    fill_in "password", with: user.password
    click_on "submit"

    expect(page).to have_content("Welcome back!")

    visit project_path(project.id)

    within(".votes_section") do
      click_on "downvote_icon"

      expect(user.votes.projects.find_by(project.id).id).to eq(project.id)
      expect(user.votes.projects.find_by(project.id).vote_type).to eq("downvote")
    end
  end

  xscenario "user can change an upvote to a downvote and vice versa" do
    project = create(:project)
    user = create(:user)
    vote = user.votes.create(:vote, vote_type: 0, project_id: project.id)

    visit root_path
    click_on "Login"

    expect(current_path).to eq(login_path)
    fill_in "username", with: user.email
    fill_in "password", with: user.password
    click_on "submit"

    expect(page).to have_content("Welcome back!")

    visit project_path(project.id)

    within(".votes_section") do
      click_on "downvote_icon"

      expect(user.votes.find_by(project.id).vote_type).to eq("downvote")

      click_on "upvote_icon"

      expect(user.votes.find_by(project.id).vote_type).to eq("upvote")
    end
  end

  xscenario "user can remove vote status from a project by clicking on an existing upvote or downvote thumb icon" do
    project = create(:project)
    user = create(:user)
    vote = user.votes.create(:vote, vote_type: 0, project_id: project.id)

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
