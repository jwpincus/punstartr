FactoryGirl.define do
  factory :city do
    sequence :name do |n|
      "city#{n}"
      
    end
    association :country, :strategy => :build
    #country { |country| country.association :country, :strategy => :build }
  end
end
