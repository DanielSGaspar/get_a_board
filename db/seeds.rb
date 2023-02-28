# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@category = ["surfboard", "longboard", "bodyboard"]

@user = User.first

puts 'dropping database'
Listing.destroy_all
puts 'creating database'

5.times do |index|
  puts "creating #{index}-Listing"
  Listing.create!(
    user: @user,
    category: @category.sample,
    title: Faker::ChuckNorris.fact,
    description: Faker::Hipster.paragraph
  )
end
puts "Database created"
