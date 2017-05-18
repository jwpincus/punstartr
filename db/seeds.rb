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
    seed.generate_projects
  end

  def generate_projects
    10.times do
      Project.create!(
        title: Faker::Commerce.product_name,
        description: Faker::Hipster.paragraph,
        image_url: Faker::Avatar.image,
        target_amount: rand(1000..100000).to_f
      )
      puts "Project #{Project.all.last.title} created"
    end
  end
end

Seed.start
