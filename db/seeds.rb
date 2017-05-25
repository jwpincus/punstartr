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
    seed.generate_categories
    seed.generate_projects
    seed.generate_countries
    seed.generate_user_with_projects
    seed.generate_users
    seed.generate_project_backers
  end

  def generate_project_backers
    50.times do
      proj = ProjectBacker.create!(
                            project: Project.all.shuffle.first,
                            user: User.all.shuffle.first,
                            reward: Reward.all.shuffle.first,
                            pledge_amount: rand(10..1000),
                            created_at: Faker::Time.backward(60)
      )
      puts "ProjectBacker #{proj.user} backing #{proj.project.title} created"
    end
  end

  def generate_users
    10.times do |n|
      u = User.create!(name: "user #{n}",
                   email: "user#{n}@example.com",
                   password: "password",
                   password_confirmation: "password"
                   )
      puts "User #{u.name}, #{u.email} created"
    end
  end

  def generate_projects
    50.times do
      Project.create!(
        title: Faker::Commerce.product_name + rand(0..1000).to_s,
        description: Faker::Hipster.paragraph,
        image_url: "https://unsplash.it/600/400?image=#{rand(0..100)}",
        target_amount: rand(1000..100000).to_f,
        completion_date: Faker::Time.forward(30),
        category: Category.all.sample,
        rewards: generate_rewards
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
    countries = ['United States', 'Canada', 'Mexico']
    countries.each do |country|
      Country.create(name: country)
    end
  end

  def generate_user_with_projects
    user = User.create!(
    name: "Sample User",
    email: "email#{rand(5000)}@email.com",
    password: "password",
    password_confirmation: "password"
    )
    user.projects << Project.all.shuffle[0..4]
  end

end

Seed.start
