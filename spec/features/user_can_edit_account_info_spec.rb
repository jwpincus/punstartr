require 'rails_helper'

describe "A User can edit their profile information" do
  it "They go to their user Dash and are able to edit their info", js: true do
    user = create(:user)
    allow_any_instance_of(ApplicationController)
    .to receive(:current_user)
    .and_return(user)
    visit user_path(user)
    element = find('#name-field')
    page.find('#name-field').click
    find('#name-field').base.send_keys('Jack')
    visit user_path(user)
    # expect(page).to have_content('Jack')
  end
end
