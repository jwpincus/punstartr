require 'rails_helper'

RSpec.describe ProjectOwner, type: :model do
  it "A user can have a project" do
    user = create(:user)
    project = create(:project)
    user.projects << project
    expect(user).to respond_to(:projects)
    expect(user.projects.first).to eq(project)
  end
  it "A user can have many projects" do
    user = create(:user)
    projects = create_list(:project, 4)
    user.projects << projects
    expect(user.projects.count).to eq(4)
  end
  it "A Project has owners" do
    user = create(:user)
    project = create(:project)
    user.projects << project
    expect(project).to respond_to(:owners)
    expect(project.owners.first).to eq(user)
  end
end
