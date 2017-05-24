require 'rails_helper'

describe "Projects API" do
  it "sends a list of projects" do
    create_list(:project, 3)

    get "/api/v1/projects"

    expect(response).to be_success
  
    projects = JSON.parse(response.body)

    expect(projects.count).to eq(3)
  end
end
