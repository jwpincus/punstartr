FactoryGirl.define do
  factory :reward do
    project
    title                 Faker::Commerce.product_name
    description           Faker::Lorem.sentence
    pledge_amount         Faker::Number.decimal(2)
    limit                 Faker::Number.number(1)
  end
end
