
FactoryGirl.define do
  factory :project do
    sequence :title do |x|
      "#{x} project"
    end
    sequence :target_amount do |x|
     amount = (x * 100)
      number_to_currency(amount, unit: '€', precision: 0, format: "%u %n")
    end
    description  Faker::Lorem.paragraph
    image_url Faker::Avatar.image
    completion_date Faker::Time.forward(30)
  end
end
