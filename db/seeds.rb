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
    seed.generate_user_with_projects
  end

  def generate_projects
    50.times do
      Project.create!(
        title: Faker::Commerce.product_name,
        description: Faker::Hipster.paragraph,
        image_url: "https://unsplash.it/600/400?image=#{rand(0..100)}",
        target_amount: rand(1000..100000).to_f,
        completion_date: Faker::Time.forward(30),
        category: Category.all.sample
      )
      puts "Project #{Project.all.last.title} created"
    end
  end

  def generate_categories
    categories = ['Art', 'Technology', 'Design', 'Games', 'Fashion']
    categories.each do |category|
      Category.create(name: category)
    end
  end

  def generate_user_with_projects
    user = User.create!(
    name: "Sample User",
    email: "email@email.com",
    password: "password",
    password_confirmation: "password"
    )
    user.projects << Project.all.shuffle[0..4]
  end

end

Seed.start
