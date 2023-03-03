# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
User.destroy_all

user1 = User.create(email: "zemanel@gmail.com", password: "111111")

category = ["Surfboard", "Longboard", "Bodyboard"]
title = ["Al Merrick", "Pyzel", "Tokoro", "Sharpeye"]
size = ["6.0'", "7.8'", "5.8'", "8.0'"]
user = User.first
price = [100, 150, 200, 180]
location = ["Cascais", "Estoril", "Lisboa"]
images = ["https://www.semente.pt/wp-content/uploads/2020/08/D-2_white.png", "https://images.squarespace-cdn.com/content/v1/56ce2d7acf80a11b2f1489c7/1644458926900-Y7KA2YDVE6CS2QENVNKJ/blue.jpg?format=1500w", "https://cdn.shopify.com/s/files/1/0411/9757/products/ULTIMATE-LONGBOARD-SURFBOARD-BLUEDIP-_EPOXY_eae6c773-e9ea-49d6-8d66-76c4191d583e.jpg?v=1640828013", "https://cdn.shopify.com/s/files/1/1819/8849/collections/bing-levitator-type-2_1024x1024.jpg?v=1640129775", "https://cdn.shopify.com/s/files/1/0003/1902/9309/products/PlasticFantastic_8a302e51-a7f1-4fc2-ad9b-d58aef23f32c_2000x.jpg?v=1624471100"]

counter = 0

puts 'dropping database'
Booking.destroy_all
Listing.destroy_all
puts 'creating database'

5.times do |index|
  puts "creating #{index}-Listing"
  listing = Listing.new(
    user: user1,
    category: category.sample,
    title: "#{title.sample} #{size.sample}",
    description: Faker::Hipster.paragraph,
    rating: rand(1..5),
    location: location.sample,
    price: price.sample
  )
  file = URI.open(images[counter])
  file2 = URI.open(images.sample)
  listing.photos.attach(io: file, filename: "surfboard.png", content_type: "image/png")
  listing.photos.attach(io: file2, filename: "surfboard2.png", content_type: "image/png")
  listing.save
  counter += 1
end

puts "Database created"
