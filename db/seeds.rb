# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seed

  def self.begin
    seed = Seed.new
    seed.generate_groups
  end

  def generate_groups
    20.times do |i|
      group = Group.create!(
        name: Faker::Book.author
      )
      puts "Quote #{i}: Group name is #{group.name}'."
    end
  end
end

Seed.begin
