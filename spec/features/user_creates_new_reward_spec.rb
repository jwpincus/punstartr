require 'rails_helper'

RSpec.feature "User adds a new reward to the database" do
  scenario "user can fill out a form and generate a new reward" do
    project = create(:project)

    visit "new_reward_path"

    fill_in "reward[title]", with: "Raw Denim Romphim"
    fill_in "reward[description]", with: "24 ounce Kahari Mills left-hand twill denim"
    fill_in "reward[pledge_amount]", with: 475
    fill_in "reward[limit]", with: 1

    click_on "Save and Continue"

    expect(current_path).to eq(rewards_path)
    expect(Reward.last.title).to eq("Raw Denim Romphim")
    
    within("div.existing-rewards") do
      expect(page).to have_content("Raw Denim Romphim")
      expect(page).to have_css("img[src*='#{Reward.last.image_url}']")  
    end
  end
end
