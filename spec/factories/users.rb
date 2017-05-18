FactoryGirl.define do
  factory :user do
    HPFaker               = HarryPotterFaker.new()

    name                  HPFaker.name
    email                 Faker::Internet.email
    password              "password"
    password_confirmation "password"
  end
end
