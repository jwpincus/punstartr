require 'rails_helper'

describe 'projects with most backers' do
  it "returns x number of project" do
    @categories = create_list(:category, 4)

    cat_count = [30, 20, 10, 5]
    @categories.each_with_index do |category, i|
      create_list(:project, cat_count[i], category: category)
    end

    get "/api/v1/categories/count_by_project"

    expect(response).to be_success
    categories = JSON.parse(response.body, symbolize_names: true)

    expect(categories.count).to eq(4)
    expect(categories.first).to have_key(:name)
    expect(categories.first).to have_key(:count)
    expect(categories.first[:name]).to eq(@categories.first.name)
    expect(categories.first[:count]).to eq(cat_count.first)
  end
end
