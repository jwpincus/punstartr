require 'rails_helper'

describe Country do
  context "associations" do
    it { should have_many(:projects) }  
  end
end
