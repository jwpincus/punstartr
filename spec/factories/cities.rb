FactoryGirl.define do
  factory :city do
    sequence :name do |n|
      "city#{n}"
    end
    factory :city_with_country do
      country {create(:country)}
    end
  end
end
