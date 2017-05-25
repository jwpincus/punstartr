require "rails_helper"

RSpec.feature "As a user" do
  scenario "they can see a city of the project in google map" do
    project = create(:project)

    visit project_path(project)

    city_map = "https://www.google.com/maps/embed/v1/place?key=AIzaSyC3kyyZa_6q0s1dqTdI93pSxImIR3qewjM&q=#{project.city['name']}"

    within(".map_box") do
     iframe = page.find("iframe")
     expect(iframe[:src]).to eq(city_map)
    end
  end
end