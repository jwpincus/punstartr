require 'rails_helper'

describe "A User can edit their profile information" do
  it "They go to their user Dash and are able to edit their info", js: true do
    user = create(:user)
    visit user_path(user)
    find_element(css: '#name-field').click
    
  end
end
