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

puts 'Destroy Bookings'
Booking.destroy_all
puts 'Destroy Planets'
Planet.destroy_all
puts 'Destroy Users'
User.destroy_all

puts "Creating Users..."
User.create!(email: 'emmanuel@emmanuel.com', name: 'Emmanuel', phone_number: '890895643322', password: 'azerty')
User.create!(email: 'loris@loris.com', name: 'Loris', phone_number: '89006789', password: 'azerty')
User.create!(email: 'sophie@sophie.com', name: 'Sophie', phone_number: '567543221', password: 'azerty')
puts "Users ok !"

puts "Creating Fake Users..."
10.times do

    name = Faker::Movies::StarWars.character
    name_w_space = name.delete(' ')
    user = User.create!(email: "#{name_w_space}#{rand(1..1000)}@#{name_w_space}.com", name: "#{name}#{rand(1..1000)}", phone_number: '12345678', password: 'azerty')
    user.save!
end
puts "Fake Users ok ! "

puts "creating planets ..."
20.times do

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
                      user: User.all.sample,
                      climat: climats.sample,
                      specie: Faker::Movies::StarWars.specie,
                      activity: activities.sample,
                      description: 'A long time ago, in a galaxy far, far away...
                                    It is a period of civil war. Rebel
                                    spaceships, striking from a hidden
                                    base, have won their first victory
                                    against the evil Galactic Empire.
                                    During the battle, Rebel spies managed
                                    to steal secret plans to the Empire\'s
                                    ultimate weapon, the Death Star, an
                                    armored space station with enough
                                    power to destroy an entire planet...'
                      )
  file = URI.open(['https://static.wikia.nocookie.net/frstarwars/images/c/c1/Batuu.png/revision/latest?cb=20200822103848', 'https://static.wikia.nocookie.net/frstarwars/images/a/a5/Geonosis.png/revision/latest?cb=20160402134809','https://www.10wallpaper.com/wallpaper/1920x1440/1302/Star_Wars_Planet-Universe_space_HD_Desktop_Wallpaper_1920x1440.jpg','https://i.ytimg.com/vi/Xb8Ba_eKVfY/maxresdefault.jpg','https://d2cdo4blch85n8.cloudfront.net/wp-content/uploads/2019/08/Planet-with-Three-Suns-Discovered-Featured-image.jpg', 'https://www.wallpaperflare.com/static/199/98/339/star-wars-planet-moon-battle-wallpaper.jpg', 'https://www.starwars-holonet.com/holonet/images/d/dc/11201/planete_castilon_1.jpg'].sample)
  planet.photo.attach(io: file, filename: "#{rand(1..1000)}.jpg", content_type: 'image/jpg')
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
