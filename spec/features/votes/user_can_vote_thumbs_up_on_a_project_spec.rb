require 'rails_helper'

RSpec.feature "as a user", js: true do
  scenario "guest user can view project votes on project page" do
    project = create(:project_with_votes)

    visit project_path(project.id)

    # sleep(2)

    within(".votes_section") do
      expect(page).to have_content("#{project.upvotes} people love this project.")
    end
  end

  scenario "guest user has to log in if she wishes to upvote a project" do
    project = create(:project_with_votes)

    visit project_path(project.id)

    sleep(2)

    within(".votes_section") do
      expect(page).to have_content("HEY! Please sign up or log in to support this project with a vote.")
    end
  end

  scenario "logged-in user can upvote a project by clicking the thumbs up icon" do
    project = create(:project)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "projects/#{project.id}"

    within(".votes_section") do
      find("#thumbup").click
    end
    sleep(2)
    expect(user.votes.first.project).to eq(project)
  end

  scenario "user can remove vote status from a project by clicking on an existing upvote icon" do
    project = create(:project)
    user = create(:user)
    vote = create(:vote, project_id: project.id, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit project_path(project.id)

    within(".votes_section") do
      find("#thumbdown").click
    end

    sleep(2)
    expect(user.votes.find_by(project_id: @project_id)).to eq(nil)
  end
end
