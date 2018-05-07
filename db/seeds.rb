# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p 'seeding start'
# p "Seeding 20 books"
#
# 20.times do |book|
#   Book.create! title: Faker::Book.title,
#   author: Faker::Book.author,
#   image: Faker::Avatar.image
# end
#
# p "Seeding 10 users"
#
# 10.times do |user|
#   User.create! email: Faker::Internet.email,
#     password: "test_user"
# end
#
# p "Seeding 100 reviews"
#
# 100.times do |review|
#   Review.create! title: "The best book of all time",
#   content_rating: Faker::Number::between(1, 10),
#   recommend_rating: Faker::Number::between(1, 10),
#   user_id: Faker::Number::between(1, 10),
#   book_id: Faker::Number::between(1, 20)
# end
public_id_interior = ['RPP9419_mp7xjn', 'redbrick_bklymp', 'dewhirst_electric_co_lofts-01_oxgife', 'flat_image-1524032783-4', 'flat_image-1524032783-3', 'flat_image-1524032783-2', 'flat_image-1524032783-5', 'flat_image-1524032783-1']
public_id_facade = ['flat_image-1524032783-0', 'flat_image-1523948892-1', 'flat_image-1523948892-0']
flats = [
  {
    lat: 37.7952,
    lng: -122.4029,
    area: "Financial District",
    sales_point: "Modern appointments!",
    price_per_month: 2500,
    beds: 2,
    rooms: 2,
    description: "Two bedroom house",
    flat_type: "House",
    bath: 2
  },
  {
    lat: 37.787994,
    lng: -122.407437,
    area: "Union Square",
    sales_point: "Worldclass Shopping!",
    price_per_month: 3000,
    beds: 1,
    rooms: 1,
    description: "One bedroom flat",
    flat_type: "flat",
    bath: 1
  },
  {
    lat: 37.76904,
    lng: -122.483519,
    area: "Golden Gate Park",
    sales_point: "Within minutes of wonderful park!",
    price_per_month: 2100,
    beds: 2,
    rooms: 1,
    description: "One bedroom apartment",
    flat_type: "flat",
    bath: 1.5
  },
  {
    lat: 37.80499678 ,
    lng: -122.409331696,
    area: "Fisherman's Wharf",
    sales_point: "Seconds from Fisherman's Wharf!",
    price_per_month: 2600,
    beds: 1,
    rooms: 1,
    description: "Room in house",
    flat_type: "flat",
    bath: 1
  },
  {
    lat: 37.75986,
    lng: -122.41480,
    area: "Mission District",
    sales_point: "Convenient transportation!",
    price_per_month: 5000,
    beds: 2,
    rooms: 2,
    description: "Two bedroom house",
    flat_type: "House",
    bath: 1
  },
  {
    lat: 37.80330 ,
    lng: -122.27106,
    area: "Downtown Oakland",
    sales_point: "Great for East Bay worker!",
    price_per_month: 3000,
    beds: 3,
    rooms: 3,
    description: "Three bedroom house",
    flat_type: "House",
    bath: 2.5

  },
  {
    lat: 37.80367 ,
    lng: -122.43682,
    area: "Marina District",
    sales_point: "Enjoy nice walks in the marina!",
    price_per_month: 4000,
    beds: 1,
    rooms: 1,
    description: "One bedroom apartment",
    flat_type: "Flat",
    bath: 1
  },
  {
    lat: 37.80110 ,
    lng: -122.41956,
    area: "Russian Hill",
    sales_point: "Great views of the Bay!",
    price_per_month: 3000,
    beds: 1,
    rooms: 1,
    description: "One bedroom apartment",
    flat_type: "Flat",
    bath: 2
  },
  {
    lat: 37.79803 ,
    lng: -122.43965,
    area: "Cow Hollow",
    sales_point: "Nice shops everywhere!",
    price_per_month: 2222,
    beds: 2,
    rooms: 1,
    description: "One bedroom apartment",
    flat_type: "Flat",
    bath: 1
  },
  {
    lat: 37.79252,
    lng: -122.43823,
    area: "Pacific Heights",
    sales_point: "Spectacular views!",
    price_per_month: 4500,
    beds: 1,
    rooms: 1,
    description: "One bedroom apartment",
    flat_type: "Flat",
    bath: 1
  }
]


p "Seeding 10 flats"
flats.each do |flat|
  p flat[:lat]
  p flat[:lng]
  f = Flat.new(lat: flat[:lat], lng: flat[:lng], area: flat[:area], price_per_month: flat[:price_per_month], sales_point: flat[:sales_point], description: flat[:description], rooms: flat[:rooms], beds: flat[:beds], flat_type: flat[:flat_type], bath: flat[:bath],
  user_id: Faker::Number::between(2, 11))
  f.save
  image2 = Image.new(flat_id: f.id, publicid: public_id_interior[Faker::Number::between(0,7)])
  image3 = Image.new(flat_id: f.id, publicid: public_id_interior[Faker::Number::between(0,7)])
  image1 = Image.new(flat_id: f.id, publicid: public_id_facade[Faker::Number::between(0,2)])
  image2.save
  image1.save
  image3.save
  p f
  # p image1
  # p image2
  # p image3

end
