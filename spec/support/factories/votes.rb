FactoryGirl.define do
  factory :vote do
    vote_type 0
    user
    project
  end
end
