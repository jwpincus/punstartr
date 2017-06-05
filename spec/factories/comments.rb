FactoryGirl.define do
  factory :comment do
    user
    project
    body { Faker::Hipster.sentence }
  end
end
