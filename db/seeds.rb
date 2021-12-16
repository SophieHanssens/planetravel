# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'uri'
require 'json'
require 'faker'

puts 'Destroy Users'
User.destroy_all
puts 'Destroy Planets'
Planet.destroy_all
puts 'Destroy Bookings'
Booking.destroy_all

puts "Creating Users..."
User.create!(email: 'emmanuel@emmanuel.com', name: 'Emmanuel', phone_number: '890895643322', password: 'azerty')
User.create!(email: 'loris@loris.com', name: 'Loris', phone_number: '89006789', password: 'azerty')
User.create!(email: 'sophie@sophie.com', name: 'Sophie', phone_number: '567543221', password: 'azerty')
puts "Users ok !"

puts "Creating Fake Users..."
10.times do

    name = Faker::Movies::StarWars.character
    name_w_space = name.delete(' ')
    user = User.create!(email: "#{name_w_space}#{rand(1..15)}@#{name_w_space}.com", name: "#{name}#{rand(1..5)}", phone_number: '12345678', password: 'azerty')
    user.save!
end
puts "Fake Users ok ! "

puts "creating planets ..."
40.times do

  name = Faker::Movies::StarWars.planet
  available_places = rand(1..20)
  address = "#{Faker::Movies::StarWars.planet}, #{Faker::Address.street_address}"
  price_per_night = rand(1000..20000)
  climats = ['Desert', 'Snow', 'Jungle', 'Mountain', 'Aquatic', 'Plain']
  activities = ['Podracer', 'Trek with Dewbak', 'Creature Museum', ' Galactic Opera', 'Wars']

  planet = Planet.new(name: name,
                      address: address,
                      price_per_night: price_per_night,
                      available_places: available_places,
                      user: User.find(rand(1..10)),
                      climat: climats.sample,
                      specie: Faker::Movies::StarWars.specie,
                      activity: activities.sample
                      )
  planet.save!
  2.times do
    booking = Booking.create!(planet: planet,
                              user: User.all.reject { |user| user == planet.user}.sample,
                              status: ['Accepted', 'Declined', 'Pending'].sample,
                              arrival_date: Faker::Date.between(from: '2021-12-16', to: '2021-12-22'),
                              departure_date: Faker::Date.between(from: '2021-12-22', to: '2022-01-31'),
                              total_price: rand(2000..30000),
                              number_of_days: rand(2..10),
                              number_of_places: rand(1..30)
    )
    booking.save!
  end
end

puts "planets and Bookings created !"

puts "Seeds finished ! Congrats !"
