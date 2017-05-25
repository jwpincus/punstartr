require 'rails_helper'

describe "Most funded projects" do
  it "returns a list of the top 5 projects by funding amount" do
		
    project_list = create_list(:project_with_backers, 6)
    project_list.first.project_backers.first.update(pledge_amount: 14920)
    project_list.last.project_backers.first.update(pledge_amount: -4844334)
    project1 = project_list.first
    project2 = project_list.last
		
    get "/api/v1/projects/most_funded"

    expect(response.status).to eq(200)
    
    projects = JSON.parse(response.body)
    
    expect(projects.first["title"]).to include(project1.title)
    expect(projects.last["title"]).to_not include(project2.title)
		
  end
end

