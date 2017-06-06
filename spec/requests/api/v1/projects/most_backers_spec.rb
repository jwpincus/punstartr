require 'rails_helper'

describe 'projects with most backers' do
  attr_reader :backers, :max_backers
  before :each do
    create_list(:project_with_random_amt_of_backers, 15)
    @backers = Project.all.map {|project| project.project_backers.count }
    @max_backers = backers.max
  end
  it "returns x number of project" do
    limit = 6
    min_backers = backers.sort.reverse.take(limit).last

    get "/api/v1/projects/most_backers", params: {limit: limit}

    expect(response).to be_success
    projects = JSON.parse(response.body, symbolize_names: true)

    expect(projects.count).to eq(limit)
    expect(projects.first[:backers]).to eq(max_backers)
    expect(projects.last[:backers]).to eq(min_backers)
  end
  it "returns default (10) number of projects" do
    min_backers = backers.sort.reverse.take(10).last

    get "/api/v1/projects/most_backers"

    expect(response).to be_success
    projects = JSON.parse(response.body, symbolize_names: true)

    expect(projects.count).to eq(10)
    expect(projects.first[:backers]).to eq(max_backers)
    expect(projects.last[:backers]).to eq(min_backers)
  end
end
