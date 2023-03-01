# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


@category = ["Surfboard", "Longboard", "Bodyboard"]
@title = ["Al Merrick", "Pyzel", "Tokoro", "Sharpeye"]
@size = ["6.0'", "7.8'", "5.8'", "8.0'"]
@user = User.first
@price = [100, 150, 200, 180]

puts 'dropping database'
Booking.destroy_all
Listing.destroy_all
puts 'creating database'

5.times do |index|
  puts "creating #{index}-Listing"
  Listing.create!(
    user: @user,
    category: @category.sample,
    title: "#{@title.sample} #{@size.sample}",
    description: Faker::Hipster.paragraph,
    rating: rand(1..5),
    location: Faker::Address.street_address,
    price: @price.sample
  )
end
puts "Database created"
