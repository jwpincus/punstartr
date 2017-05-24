require 'rails_helper'

describe "Projects API" do
  it "sends a list of projects" do
    project_list = create_list(:project, 3)

    get "/api/v1/projects"

    expect(response).to be_success
  
    projects = JSON.parse(response.body)
    binding.pry
    expect(projects.count).to eq(3)
    expect(projects.first["title"]).to eq(project_list.first.title)
    expect(projects.first["description"]).to eq(project_list.first.description)
    expect(projects.first["image_url"]).to eq(project_list.first.image_url)
    expect(projects.first["target_amount"]).to eq(project_list.first.target_amount)
    expect(projects.first["completion_date"]).to eq(project_list.first.completion_date)

  end
end
