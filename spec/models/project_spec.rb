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

  describe ".create_slug" do
    it "returns name to be used in place of id" do
      project = create(:project)

      expect(project.slug). to eq project.title.parameterize
    end
  end

  describe "associations" do
    it { should belong_to(:category) }
    it { should belong_to(:country)}
    it { should have_many(:rewards) }
    it { should have_many(:project_backers) }
    it { should have_many(:backers).through(:project_backers) }
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

  describe "#total_pleged" do
    it "returns total pleged amount of the the project" do
      project = create(:project_with_backers)
      expect(project.total_pledged).to match(/[\d]+/)
    end
  end

  describe ".most_funded" do
    it "returns top project by amount funded" do
      project_1 = create(:project_with_backers)
      project_1.project_backers.first.update(pledge_amount: 50)
      project_2 = create(:project_with_backers)
      expect(Project.most_funded).to match(project_1)
    end
  end

  describe "#days_remaining" do
    it "returns the days remaining as a string" do
      project = create(:project)
      expect(project.days_remaining).to match(/\d/)
    end
  end
end
