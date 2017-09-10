# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Favorite.destroy_all
Search.destroy_all
YelpRestaurant.destroy_all
GasStation.destroy_all
Hotel.destroy_all
Destination.destroy_all

user = User.create({
        :username => "Garima",
        :email => "e@mail.com",
        :password => "password"
        })

yelp = YelpRestaurant.create({
        :name => "Restaurant1",
        :address => "123 Blvd, Here, CA",
        :ratings => 3,
        :price_range => 3
  })

gas = GasStation.create({
        :name => "Gas1",
        :address => "456 Blvd, Here, CA"
  })

hotel = Hotel.create({
        :name => "Hotel1",
        :address => "789 Blvd, Here, CA",
        :rating => 3,
        :price => 3
  })

destination = Destination.create({
        :address => "789 Blvd, Here, CA",
  })

search = Search.create({
  :search_count => 1,
  :user_id => User.first.id,
  :destination_id => Destination.first.id
  })

idx = 0
fav_type = [YelpRestaurant, GasStation, Hotel, Destination]
while idx < fav_type.length
  Favorite.create({
    :user_id => user.id,
    :favoritable_id => 1,
    :favoritable_type => fav_type[idx]
  })
  idx += 1
end
