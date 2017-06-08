require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "should validate presence of name, email" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:email) }
    end

    describe "associations" do
      it { should have_many(:project_owners) }
      it { should have_many(:projects).through(:project_owners) }
      it { should have_many(:project_backers) }
      it { should have_many(:backed_projects).through(:project_backers) }
      it { should have_many(:comments) }
    end
  end


end
