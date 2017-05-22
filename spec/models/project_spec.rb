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

  describe "associations" do
    it { should belong_to(:category) }
    it { should have_many(:rewards) }
    it { should have_many(:project_funders) }
    it { should have_many(:funders).through(:project_funders) }
  end

  describe "#target_amount" do
    it "returns formatted price" do
      project = create(:project)

      expect(project.formatted_price).to match(%r{\$[,\d]+\z})
    end
  end

  describe "#end_date" do
    it "returns formated end date" do
      project = create(:project)

      expect(project.end_date).to match(%r{[\w]+ [\d]+, [\d]{4}})
    end
  end

  describe "#end_time" do
    it "returns formatted end time" do
      project = create(:project)

      expect(project.end_time).to match(%r{[\d]+:[\d]{2}})
    end
  end

  describe "#end_date_time" do
    it "returns formatted end date and time" do
      project = create(:project)
      expect(project.end_date_time).to match(%r{at})
    end

  end

end
