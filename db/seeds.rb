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

User.destroy_all
Planet.destroy_all
Booking.destroy_all

def retrieve_planets(users)
  10.times do
    # url = "https://swapi.dev/api/planets/#{i}"
    # api_results = URI.open(url).read
    # planets_api = JSON.parse(api_results)

    # name = planets_api['name']
    name = Faker::Movies::StarWars.planet
    available_places = rand(1..20)
    # address = planets_api['terrain']
    address = "#{Faker::Movies::StarWars.planet}, #{Faker::Address.street_address}"
    price_per_night = rand(1000..20000)
    user = users.sample
    # p name
    # p available_places
    # p address
    # p price_per_night
    # p user
    planet = Planet.new(name: name,
                        address: address,
                        price_per_night: price_per_night,
                        available_places: available_places,
                        user: user)

    3.times do
      puts "____creating booking____"
      Booking.create!(planet: planet,
                      user: users.reject{ |x| x == user}.sample,
                      status: ['Accepted', 'Declined', 'Pending'].sample
      )

    end
    planet.save!
    puts 'created one planet .......'
  end
  # end
  puts 'finished ....'
  # puts planet.count
end
puts "____creating users____"



emmanuel = User.create!(email: 'emmanuel@emmanuel.com', name: 'emmanuel', phone_number: '890895643322', password: 'azerty')
loris = User.create!(email: 'loris@loris.com', name: 'loris', phone_number: '89006789', password: 'azerty')
sophie = User.create!(email: 'sophie@sophie.com', name: 'sophie', phone_number: '567543221', password: 'azerty')

users = [emmanuel, loris, sophie]

puts "____users finished____"

retrieve_planets(users)


# t.date "arrival_date"
#     t.date "departure_date"
#     t.integer "total_price"
#     t.string "status"
#     t.bigint "planet_id", null: false
#     t.bigint "user_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["planet_id"], name: "index_bookings_on_planet_id"
#     t.index ["user_id"], name: "index_bookings_on_user_id"
