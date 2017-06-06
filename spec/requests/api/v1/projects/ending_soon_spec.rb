require 'rails_helper'

describe 'projects with most backers' do
  attr_reader :completion_dates, :max_date
  before :each do
    create_list(:project, 15)
    @completion_dates = Project.all.map {|project| project.completion_date }
    @max_date = completion_dates.max.strftime("%Y-%m-%dT%H:%M:%S.000Z")
  end
  it "returns x number of project" do
    limit = 6
    min_date = completion_dates.sort.reverse.take(limit).last
      .strftime("%Y-%m-%dT%H:%M:%S.000Z")

    get "/api/v1/projects/ending_soon", params: {limit: limit}

    expect(response).to be_success
    projects = JSON.parse(response.body, symbolize_names: true)

    expect(projects.count).to eq(limit)
    expect(projects.first[:completion_date]).to eq(max_date)
    expect(projects.last[:completion_date]).to eq(min_date)
  end
  it "returns default (10) number of projects" do
    min_date = completion_dates.sort.reverse.take(10).last
      .strftime("%Y-%m-%dT%H:%M:%S.000Z")

    get "/api/v1/projects/ending_soon"

    expect(response).to be_success
    projects = JSON.parse(response.body, symbolize_names: true)

    expect(projects.count).to eq(10)
    expect(projects.first[:completion_date]).to eq(max_date)
    expect(projects.last[:completion_date]).to eq(min_date)
  end
end
