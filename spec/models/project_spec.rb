require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "validations" do
    context "validates title, description, image_url, target_amount" do
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:description) }
      it { should validate_presence_of(:image_url) }
      it { should validate_presence_of(:target_amount) }
      it { should validate_presence_of(:category_id) }
      it { should validate_presence_of(:completion_date) }
    end
  end
end
