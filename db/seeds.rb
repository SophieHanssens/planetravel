# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'uri'
require 'json'

User.destroy_all

Planet.destroy_all

def retrieve_planets(users)
  i = 1
  until i == 5 do

    # url = "https://swapi.dev/api/planets/#{i}"
    # api_results = URI.open(url).read
    # planets_api = JSON.parse(api_results)

    # name = planets_api['name']
    name = rand(400000..20000000)
    available_places = rand(1..20)
    # address = planets_api['terrain']
    address = rand(400000..20000000)
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
    planet.save!
    puts 'created one planet .......'
    i += 1
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
