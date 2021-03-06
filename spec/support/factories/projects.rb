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

    factory :project_with_votes do
      votes {create_list(:vote, 3)}
    end

    factory :project_with_backers do
      project_backers {create_list(:project_backer, 3)}
    end

    factory :project_with_random_amt_of_backers do
      project_backers {create_list(:project_backer, rand(1..10))}
    end
    association :city, :strategy => :build
    association :country, :strategy => :build
    # city { |city| city.association :city, :strategy => :build }
  end
end
