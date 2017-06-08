require 'rails_helper'

feature "analytics dashboard" do
  before :all do
    create_list(:project, 20)
  end
  scenario "user can access via nav bar" do
    visit root_path

    within(".nav-wrapper") do
      click_on "Analytics"
    end

    expect(current_path).to eq(graphs_path)
  end
  scenario "view project backers bar chart" do
    visit graphs_path

    expect(page).to have_selector("#plot-container", count: 1)
    expect(page).to have_selector("#pie-container", count: 1)
  end
end
