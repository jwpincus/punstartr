require 'rails_helper'

describe 'projects with most backers' do
  before :each do
    create_list(:project_with_random_amt_of_backers, 10)
  end
  it "returns x number of project" do
    limit = 6
    backers = Project.all.map {|project| project.project_backers.count }
    max_backers = backers.max
    min_backers = backers.sort.reverse.take(limit).last

    get "/api/v1/projects/most_backers", params: {limit: limit}

    expect(response).to be_success
    projects = JSON.parse(response.body, symbolize_names: true)

    expect(projects.count).to eq(limit)
    expect(projects.first[:backers]).to eq(max_backers)
    expect(projects.last[:backers]).to eq(min_backers)
  end
  # xit "returns default (10) number of properties" do
  #
  #   get "/api/v1/properties/most_guests"
  #
  #   expect(response).to be_success
  #   properties = JSON.parse(response.body, symbolize_names: true)
  #
  #   expect(properties.count).to eq(10)
  #   expect(properties.first[:number_of_guests]).to eq(30)
  #   expect(properties.first[:city]).to eq("Tulsa")
  #   expect(properties.last[:number_of_guests]).to eq(21)
  #   expect(properties.last[:city]).to eq("Denver")
  # end
end
