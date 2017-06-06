require 'rails_helper'

RSpec.feature "User adds a new reward to the database" do
  context "when city does not exist yet" do
    it "can create rewards" do
      category = create(:category)
      country = create(:country)
      user = create(:user)
      date = (Date.today + 30.days).strftime("%B %d, %Y")
      image_url =  Faker::Avatar.image
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(user)
      visit new_project_path

      select category.name,                from: 'project_category_id'
      fill_in 'project[title]',            with: 'Crafters Paradise'
      fill_in 'project[description]',      with: 'Lots of paint'
      fill_in 'project[image_url]',        with: image_url
      fill_in 'project[target_amount]',    with: '10000'
      fill_in 'project[city]',             with: 'Paris'
      select country.name,                 from: 'project_country_id'

      click_on 'Save and continue'

      expect(current_path).to eq('/rewards/new')
      fill_in "reward[title]", with: "Raw Denim Romphim"
      fill_in "reward[description]", with: "24 ounce Kahari Mills left-hand twill denim"
      fill_in "reward[pledge_amount]", with: 475
      fill_in "reward[limit]", with: 1

      click_on 'Save and Continue'

      expect(current_path).to eq("/projects/#{Project.last.id}")
      expect(Reward.last.title).to eq("Raw Denim Romphim")
      expect(Reward.last.description).to eq("24 ounce Kahari Mills left-hand twill denim")
      expect(Reward.last.pledge_amount).to eq(475)
      expect(Reward.last.limit).to eq(1)
      expect(page).to have_content("Raw Denim Romphim")
      expect(current_path).to eq("/projects/#{Project.last.id}")
      expect(page).to have_content('Crafters Paradise')
      expect(page).to have_content('Lots of paint')
      expect(page).to have_css("img[src*='#{image_url}']")
      expect(page).to have_content('$10,000')
      expect(page).to have_content(date)
    end
  end
end
