require 'rails_helper'

RSpec.describe City, type: :model do
  let(:city) {create(:city)}

  describe "attributes" do
    it "has a name and country" do
      expect(city).to respond_to(:name)
      expect(city).to respond_to(:country)
      expect(city).to respond_to(:country_id)
    end
  end

  describe "relationships" do
    it "has a many to many relationship with categories" do
      should have_many(:projects)
    end
    it "has a many to many relationship with order" do
      should belong_to(:country)
    end
  end
end
