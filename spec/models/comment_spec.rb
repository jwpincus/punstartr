require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validations" do
    context "should validate presence of the body" do
      it { should validate_presence_of(:body) }
    end
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:project) }
  end
end
