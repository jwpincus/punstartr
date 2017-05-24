FactoryGirl.define do
  factory :city do
    sequence :name do |n|
      "city#{n}"
    end
  end
end
