# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Brennan", email:"Brennan@brennan.com", password: "brennan")
User.create(username: "Leah", email:"Leah@leah.com", password: "leah")
User.create(username: "Alia", email:"Alia@Alia.com", password: "alia")
User.create(username: "Grace", email:"Grace@Grace.com", password: "grace")
User.create(username: "Anna", email:"Anna@anna.com", password: "anna")

Property.create(name: "Tahoe Chalet", bedrooms: 5, bathrooms: 4, user_id: 4, location_id: 1, available: 1)
Property.create(name: "Idylwild Cabin", bedrooms: 3, bathrooms: 2, user_id: 5, location_id: 2, available: 1)
Property.create(name: "Malibu Beach House", bedrooms: 4, bathrooms: 3, user_id: 4, location_id: 3, available: 1)
Property.create(name: "Cozy Maine Cottage", bedrooms: 2, bathrooms: 2, user_id: 8, location_id: 4, available: 1)
Property.create(name: "Desert Retreat", bedrooms: 4, bathrooms: 3, user_id: 6, location_id: 6, available: 1)


Location.create(name: "Tahoe", state: "California")
Location.create(name: "Idylwild", state: "California")
Location.create(name: "Malibu", state: "California")
Location.create(name: "Camden", state: "Maine")
Location.create(name: "Hudson", state: "New York")
Location.create(name: "Santa Fe", state: "New Mexico")

Amenity.create(name: "Hot Tub")
Amenity.create(name: "Air Conditioning")
Amenity.create(name: "Home Gym")
Amenity.create(name: "Wifi")
Amenity.create(name: "BBQ Grill")
Amenity.create(name: "Pool")
Amenity.create(name: "Sauna")