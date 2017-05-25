# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
class Seed

  def self.start
    seed = Seed.new
    seed.generate_countries
    seed.generate_cities
    seed.generate_categories
    seed.generate_projects
    seed.generate_user_with_projects

  end

  def generate_project_backers
    rand(3..10).times.map do |n|
      ProjectBacker.create!(
                            user: generate_user,
                            reward: Reward.all.shuffle.first,
                            pledge_amount: rand(10..1000),
                            created_at: Faker::Time.backward(60)
      )
    end
  end

  def generate_user
    User.create!(name: Faker::Name.name,
                 email: "user#{rand(0..100000)}@example.com",
                 password: "password",
                 password_confirmation: "password"
                 )
  end

  def generate_projects
    puts "generating projects"
    50.times do
      Project.create!(
        title: Faker::Commerce.product_name + rand(0..1000).to_s,
        description: Faker::Hipster.paragraph,
        image_url: "https://unsplash.it/600/400?image=#{rand(0..100)}",
        target_amount: rand(1000..100000).to_f,
        completion_date: Faker::Time.forward(30),
        category: Category.all.sample,
        rewards: generate_rewards,
        project_backers: generate_project_backers,
        country_id: rand(1..4),
        city_id: rand(1..5)
      )
      puts "Project #{Project.all.last.title} created"
    end
  end

  def generate_rewards
    4.times.map do |n|
      Reward.create!({title: "reward_#{n}",
                      description: Faker::Hipster.paragraph,
                      pledge_amount: n * 100,
                      limit: 4})
    end
  end

  def generate_categories
    categories = ['Art', 'Technology', 'Design', 'Games', 'Fashion']
    categories.each do |category|
      Category.create(name: category)
    end
  end

  def generate_countries
    countries = ['United States', 'Canada', 'Mexico', "France"]
    countries.each do |country|
      Country.create(name: country)
    end
  end

  def generate_user_with_projects
    puts "making user with projects"
    user = User.create!(
                        name: "Sample User",
                        email: "user_with_projects@email.com",
                        password: "password",
                        password_confirmation: "password"
                        )
    user.projects << Project.all.shuffle[0..4]
  end

  def generate_cities
    cities = ["New York", "Paris", "Denver", "Chicago", "San Francisco"]
      cities.each do |city|
        City.create(name: city, country_id: rand(1..4))
      puts "City #{City.name} created"
    end
  end
end

Seed.start
