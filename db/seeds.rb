# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
restaurant_categories = %W[chinese italian japanese french belgian]
10.times do
  @new_restautrant = Restaurant.create(
    name: Faker::Name.name,
    address: Faker::Address.full_address,
    phone_number: Faker::Number.number(digits: 10),
    category: restaurant_categories[rand(restaurant_categories.length)]
  )
  rand(2..10).times do
    Review.create(
      content: Faker::Hipster.paragraphs(number: 1),
      rating: rand(0..5),
      restaurant: @new_restautrant
    )
  end
end
