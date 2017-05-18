
FactoryGirl.define do
  factory :project do
    sequence :title do |x|
      "#{x} project"
    end
    sequence :target_amount do |x|
      x * 1000
    end
    description  Faker::Lorem.paragraph
    image_url Faker::Avatar.image
  end
end
