FactoryGirl.define do
  factory :project do
    sequence :title do |x|
      "#{x} project"
    end
    sequence :target_amount do |x|
     (x * 100)
    end
    description  { Faker::Lorem.paragraph }
    image_url { Faker::Avatar.image }
    completion_date { Faker::Time.forward(30) }
    category

    factory :project_with_rewards do
      rewards {create_list(:reward, 3)}
    end
  end
end
