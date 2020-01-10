# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# p 'seeding start'
# # p "Seeding 20 books"
# #
# # 20.times do |book|
# #   Book.create! title: Faker::Book.title,
# #   author: Faker::Book.author,
# #   image: Faker::Avatar.image
# # end
# #
# # p "Seeding 10 users"
# #
# # 10.times do |user|
# #   User.create! email: Faker::Internet.email,
# #     password: "test_owner"
# # end
# #
# # p "Seeding 100 reviews"
# #
# # 100.times do |review|
# #   Review.create! title: "The best book of all time",
# #   content_rating: Faker::Number::between(1, 10),
# #   recommend_rating: Faker::Number::between(1, 10),
# #   user_id: Faker::Number::between(1, 10),
# #   book_id: Faker::Number::between(1, 20)
# # end

 users = [
   { email: "test1@test.com",
     password: '123456',
     password_confirmation: '123456',
     email_confirmed: true,
     image: 'mlk',
     test_owner: true,
     test_tenant: false,
     bank_accounts: [
       {
        account_first_name: nil,
        account_last_name: nil,
        account_name: "サイトウカツオ",
        bank_name: "三菱UFJ銀行",
        branch_name: nil,
        bank_address: nil,
        branch_number: nil,
        account_number: "1234",
        account_type: "ordinary",
        routing_number: nil,
        swift: "MBUFJ000001",
        bank_name_english: "Mitsubishi UFJ Bank Co. Ltd.",
        account_name_english: "Katsuo Saito"
       }
     ],
     profiles: [
       {
          image: "tesla",
          title: "Mr.",
          name: "My Company K.K.",
          first_name: "Tanaka",
          middle_name: nil,
          last_name: "Taro",
          username: "NotNicolaTesla",
          address1: "Azabu Juban 1-1-1",
          address2: nil,
          city: "Minato-ku",
          state: "Tokyo",
          zip: "111-1111",
          country: "日本",
          language: nil,
          birthday: "1950-03-01",
          phone: "03-1111-1111",
          emergency_contact_name: "Kintaro",
          emergency_contact_phone: "0311111111",
          introduction: "Hello, again. This is a fictional character. The one before me got unceremonially deleted because I accidentally used dependent destroy the wrong way. I will not do it again. I will be a good person.",
          language_code: "en",
          corporation: false,
      },
      {
          image: nil,
          name: "株式会社My Company",
          title: nil,
          name: nil,
          first_name: "太郎",
          middle_name: nil,
          last_name: "田中",
          username: "NotNicolaTesla",
          address1: "麻布十番１−１−１",
          address2: nil,
          city: "港区",
          state: "東京都",
          zip: "100-0001",
          country: "日本",
          language: nil,
          birthday: nil,
          phone: "03-1111-1111",
          emergency_contact_name: "田中桃子",
          emergency_contact_phone: "0311111111",
          introduction: "ハロー。",
          language_code: "jp",
          corporation: false,
      }
    ],
    contractors: [
      {
        contractor_type: "rental_broker",
        phone: "03-1111-1111",
        company_name: "GGG Co. Ltd",
        registration_number: "12345678",
        registration_date: "1980-06-01",
        registration_jurisdiction: "Tokyo",
        registration_grantor: "governor",
        registration_number_front: "7",
        first_name: "Shin",
        last_name: "Otani",
        address1: "Azabu Juban ２−２−１",
        city: "Minato-ku",
        zip: "100-0001",
        state: "Tokyo",
        country: "Japan",
        language_code: "en",
        # !!!! Need to have base_record: true as first in array of contractors
        base_record: true,
        staffs: [
          {
            first_name: "Shouji",
            last_name: "Otani",
            title: "Sales Manager",
            representative: false,
            manager: false,
            registration: "12345678910",
            phone: "03-1111-1111",
            address1: "Azabu Juban 2−2−1",
            city: "Minato-ku",
            state: "Tokyo",
            country: "Japan",
            zip: "100-0001",
            language_code: "en",
            registration_jurisdiction: "Tokyo",
            base_record: true,
          },
          {
            first_name: "翔時",
            last_name: "大谷",
            title: "営業部長",
            representative: false,
            manager: false,
            registration: "12345678910",
            phone: "311111111",
            address1: "麻布十番2−2−1",
            city: "港区",
            state: "東京都",
            country: "日本",
            zip: "100-0001",
            language_code: "jp",
            registration_jurisdiction: "東京都",
            base_record: false
          }
        ]
      },
      {
        contractor_type: "rental_broker",
        phone: "03-1111-1111",
        company_name: "GGG株式会社",
        registration_number: "12345678",
        registration_date: "1980-06-01",
        registration_jurisdiction: "東京都",
        registration_grantor: "governor",
        registration_number_front: "7",
        first_name: "新",
        last_name: "大谷",
        address1: "麻布十番２−２−１",
        city: "港区",
        zip: "100-0001",
        state: "東京都",
        country: "日本",
        language_code: "jp",
        base_record: false,
        staffs: nil
      }
    ]
   },
  { email: "test2@test.com",
    password: '123456',
    password_confirmation: '123456',
    email_confirmed: true,
    image: 'einstein_tongue',
    profile: nil,
    test_owner: false,
    test_tenant: true,
    profiles: [
      {
        first_name: "金太郎",
        middle_name: nil,
        last_name: "斎藤",
        username: "TheThirdIncarnation",
        address1: "麻布十番１−１−１",
        address2: nil,
        city: "港区",
        state: "東京都",
        zip: "100-0001",
        region: nil,
        country: "日本",
        language: nil,
        birthday: "1950-04-01",
        gender: nil,
        introduction: "こんにちは。タローです。",
        phone: "06-3333-3333",
        emergency_contact_name: "斎藤桃太郎",
        emergency_contact_address: "111−1111東京都港区麻布十番１−１−１",
        emergency_contact_phone: "0311111111",
        emergency_contact_relationship: "妻",
        corporation: false,
        contact_name: nil,
        language_code: "jp"
      },
      {
        image: "blank_profile_picture_4",
        identification: nil,
        title: "Mr.",
        name: nil,
        first_name: "Kintaro",
        middle_name: nil,
        last_name: "Saito",
        username: nil,
        address1: "Azabu Juban 1-1-1",
        address2: nil,
        city: "Minato-ku",
        state: "Tokyo",
        zip: "111-1111",
        region: nil,
        country: "Japan",
        language: nil,
        birthday: "1950-02-02",
        gender: nil,
        introduction: "Hello I am Kintaro. Call me Kinta.",
        phone: nil,
        emergency_contact_name: "Momotaro Saito",
        emergency_contact_address: "1-1-1 Azabu Juban Minato-ku Tokyo 111-1111",
        emergency_contact_phone: "0311111111",
        emergency_contact_relationship: "Wife",
        corporation: false,
        contact_name: nil,
        language_code: "en"
      }
    ]
  },
  { email: "test3@test.com",
    password: '123456',
    password_confirmation: '123456',
    email_confirmed: true,
    image: 'oh_sadaharu',
    profile: nil,
    test_owner: false,
    test_tenant: false,
  },
  { email: "test4@test.com",
    password: '123456',
    password_confirmation: '123456',
    email_confirmed: true,
    image: 'ali',
    profile: nil,
    test_owner: false,
    test_tenant: false,
  },
]

amenity = {
  auto_lock: false,
  security_system: false,
  wifi: false,
  pocket_wifi: false,
  wheelchair_accessible: false,
  ac: false,
  heater: false,
  bath_essentials: false,
  hot_water: false,
  parking: false,
  tv: false,
  dvd_player: false,
  sofa: false,
  kitchen: false,
  dining_table: false,
  dish_washer: false,
  iron: false,
  washer: false,
  dryer: false,
  cooking_basics: false,
  eating_utensils: false,
  microwave: false,
  refrigerator: false,
  oven: false,
  crib: false,
  high_chair: false,
  bath_tub: true,
  washlet: false,
  hairdryer: false,
  fire_extinguisher: false,
  lockbox: false,
  washer_dryer_area: true,
  cable_tv: false,
  shower: true,
  wash_basin: false,
  kitchen_grill: true,
  lighting_fixed: false,
  internet_ready: false,
  mail_box: true,
  parcel_delivery_box: true,
  lock_key: false
}

public_id_interior = ['RPP9419_mp7xjn', 'redbrick_bklymp', 'dewhirst_electric_co_lofts-01_oxgife', 'flat_image-1524032783-4', 'flat_image-1524032783-2', 'flat_image-1524032783-5', 'industrial_apt_u71ypd']
public_id_facade = ['flat_image-1524032783-0', 'flat_image-1523948892-1', 'flat_image-1523948892-2']
flats = [
  {
    lat: 37.7952,
    lng: -122.4029,
    area: "Financial District",
    sales_point: "Modern appointments!",
    price_per_month: 2500.0,
    minutes_to_station: 3.0,
    size: 100.0,
    beds: 2,
    rooms: 2,
    description: "Two bedroom house",
    flat_type: "House",
    bath: 2.0,
    address1: "55 Clay Street",
    city: "San Francisco",
    state: "California",
    zip: "94111",
    country: "United States of America",
    test_flat: false,
    parking_included: false,
    bicycle_parking_included: false,
    motorcycle_parking_included: false,
    key_money: 0
    },
  {
    lat: 37.787994,
    lng: -122.407437,
    area: "Union Square",
    sales_point: "Worldclass Shopping!",
    price_per_month: 3000.0,
    minutes_to_station: 10.0,
    size: 50.0,
    beds: 1,
    rooms: 1,
    description: "One bedroom flat",
    flat_type: "flat",
    bath: 1.0,
    address1: "333 Post Street",
    city: "San Francisco",
    state: "California",
    zip: "94108",
    country: "United States of America",
    places: nil,
    test_flat: false,
    parking_included: false,
    bicycle_parking_included: false,
    motorcycle_parking_included: false,
    key_money: 0
    },
  {
    lat: 37.787994,
    lng: -122.407437,
    area: "Union Square",
    sales_point: "Great Shopping Area!",
    price_per_month: 4500.0,
    minutes_to_station: 5.0,
    size: 75.0,
    beds: 2,
    rooms: 2,
    description: "Two bedroom flat",
    flat_type: "flat",
    bath: 2.0,
    address1: "333 Post Street",
    city: "San Francisco",
    state: "California",
    zip: "94108",
    country: "United States of America",
    test_flat: true,
    parking_included: false,
    bicycle_parking_included: false,
    motorcycle_parking_included: false,
    key_money: 0,
    places: [
      {
        placeid: "ChIJUUH7B4aAhYARZzM1r72kDbQ",
        place_name: "パウエルストリート駅",
        category: "subway_station",
        lat: 37.7844688,
        lng: -122.40798640000003,
        distance: 499,
        duration: 376,
        language: "jp",
        language_code: nil
      },
      {
        placeid: "ChIJm49nfYiAhYARL_3sdN7wgh8",
        place_name: "CVS",
        category: "convenience_store",
        lat: 37.7868443,
        lng: -122.40404239999998,
        distance: nil,
        duration: nil,
        language: "jp",
        language_code: nil,
      },
      {
        placeid: "ChIJ_RUEIp-AhYARcsgky6nEFRw",
        place_name: "International High School of San Francisco",
        category: "school",
        lat: 37.77538159999999,
        lng: -122.4216371,
        distance: nil,
        duration: nil,
        language: "en",
        language_code: nil
      },
      {
        placeid: "ChIJYTKuRpuAhYAR8O67wA_IE9s",
        place_name: "Civic Center",
        category: "subway_station",
        lat: 37.7795744,
        lng: -122.41371470000001,
        distance: 1274,
        duration: 975,
        language: "en",
        language_code: nil
      },
      {
        placeid: "ChIJf6FLQmSAhYARRGtBjAoDpPI",
        place_name: "Walgreens",
        category: "convenience_store",
        lat: 37.7870788,
        lng: -122.40045989999999,
        distance: nil,
        duration: nil,
        language: "en",
        language_code: nil
      }
    ],
    flat_languages: [
      {
        language_code: "jp",
        address1: "333 ポストストリート",
        city: "サンフランシスコ",
        state: "カリフォルニア州",
        zip: "94108",
        country: "アメリカ合衆国",
        area: "ユニオンスクエア",
        sales_point: "買い物が便利",
        description: "広い１LDK",
        flat_type: nil,
        intro: "物件の紹介です！",
        cancellation: nil,
        construction: nil,
        owner_name: "メガカンパニー株式会社",
        owner_contact_name: "林まこと",
        owner_address: "111-1111 東京都港区南麻布２−２−１",
        ownership_rights: "所有権に関してなし。",
        other_rights: "所有権以外に関してなし。",
      }
    ],
    facilities: [
      {
        optional: true,
        facility_type: "car_parking",
        price_per_month: 200,
        discount: nil,
        facility_number: "1A",
        facility_deposit: 1,
        facility_key_money: nil,
        facility_management_fees: nil,
        facility_format: nil,
        facility_broker_fees: nil,
        facility_name: nil,
        on_building_grounds: true
      },
      {
        optional: false,
        facility_type: "bicycle_parking",
        price_per_month: 10,
        discount: nil,
        facility_number: "12D",
        facility_deposit: nil,
        facility_key_money: nil,
        facility_management_fees: nil,
        facility_format: nil,
        facility_broker_fees: nil,
        facility_name: nil,
        on_building_grounds: true
      },
      {
        optional: true,
        facility_type: "motorcycle_parking",
        price_per_month: 20,
        discount: nil,
        facility_number: "2D",
        facility_deposit: nil,
        facility_key_money: nil,
        facility_management_fees: nil,
        facility_format: nil,
        facility_broker_fees: nil,
        facility_name: nil,
        on_building_grounds: true
      }
    ]
  },
  {
    lat: 37.76904,
    lng: -122.483519,
    area: "Golden Gate Park",
    sales_point: "Within minutes of wonderful park!",
    price_per_month: 2100.0,
    minutes_to_station: 6.0,
    size: 200.0,
    beds: 2,
    rooms: 1,
    description: "One bedroom apartment",
    flat_type: "flat",
    bath: 1.5,
    address1: "Golden Gate Park",
    city: "San Francisco",
    state: "California",
    zip: "94122",
    country: "United States of America",
    test_flat: false,
    parking_included: false,
    bicycle_parking_included: false,
    motorcycle_parking_included: false,
    key_money: 0,
    places: nil
  },
  {
    lat: 37.80499678,
    lng: -122.409331696,
    area: "Fisherman's Wharf",
    sales_point: "Seconds from Fisherman's Wharf!",
    price_per_month: 2600.0,
    minutes_to_station: 7.0,
    size: 40.0,
    beds: 1,
    rooms: 1,
    description: "Room in house",
    flat_type: "flat",
    bath: 1.0,
    address1: "99-25 Bellair Pl,",
    city: "San Francisco",
    state: "California",
    zip: "94133",
    country: "United States of America",
    test_flat: false,
    parking_included: false,
    bicycle_parking_included: false,
    motorcycle_parking_included: false,
    key_money: 0,
    places: nil
  },
  {
    lat: 37.75986,
    lng: -122.41480,
    area: "Mission District",
    sales_point: "Convenient transportation!",
    price_per_month: 5000.0,
    minutes_to_station: 20.0,
    size: 150.0,
    beds: 2,
    rooms: 2,
    description: "Two bedroom house",
    flat_type: "House",
    bath: 1.0,
    address1: "2355 Folsom Street",
    city: "San Francisco",
    state: "California",
    zip: "94110",
    country: "United States of America",
    test_flat: false,
    parking_included: false,
    bicycle_parking_included: false,
    motorcycle_parking_included: false,
    key_money: 0,
    places: nil
  },
  {
    lat: 37.80330,
    lng: -122.27106,
    area: "Downtown Oakland",
    sales_point: "Great for East Bay worker!",
    price_per_month: 3000.0,
    minutes_to_station: 7.0,
    size: 125.0,
    beds: 3,
    rooms: 3,
    description: "Three bedroom house",
    flat_type: "House",
    bath: 2.5,
    address1: "427 13th St",
    city: "Oakland",
    state: "California",
    zip: "94612",
    country: "United States of America",
    test_flat: false,
    parking_included: false,
    bicycle_parking_included: false,
    motorcycle_parking_included: false,
    key_money: 0,
    places: nil
  },
  {
    lat: 37.80367,
    lng: -122.43682,
    area: "Marina District",
    sales_point: "Enjoy nice walks in the marina!",
    price_per_month: 4000.0,
    minutes_to_station: 1.0,
    size: 90.0,
    beds: 1,
    rooms: 1,
    description: "One bedroom apartment",
    flat_type: "Flat",
    bath: 1.0,
    address1: "3650 Fillmore Street",
    city: "San Francisco",
    state: "California",
    zip: "94123",
    country: "United States of America",
    test_flat: false,
    parking_included: false,
    bicycle_parking_included: false,
    motorcycle_parking_included: false,
    key_money: 0,
    places: nil
  },
  {
    lat: 37.80110,
    lng: -122.41956,
    area: "Russian Hill",
    sales_point: "Great views of the Bay!",
    price_per_month: 3000.0,
    minutes_to_station: 8.0,
    size: 110.0,
    beds: 1,
    rooms: 1,
    description: "One bedroom apartment",
    flat_type: "Flat",
    bath: 2.0,
    address1: "1200 Greenwich Street",
    city: "San Francisco",
    state: "California",
    zip: "94109",
    country: "United States of America",
    test_flat: false,
    parking_included: false,
    bicycle_parking_included: false,
    motorcycle_parking_included: false,
    key_money: 0,
    places: nil
  },
  {
    lat: 37.79803,
    lng: -122.43965,
    area: "Cow Hollow",
    sales_point: "Nice shops everywhere!",
    price_per_month: 2222.0,
    minutes_to_station: 10.0,
    size: 99.0,
    beds: 2,
    rooms: 1,
    description: "One bedroom apartment",
    flat_type: "Flat",
    bath: 1.0,
    address1: "2441 Greenwich St",
    city: "San Francisco",
    state: "California",
    zip: "94123",
    country: "United States of America",
    test_flat: false,
    parking_included: false,
    bicycle_parking_included: false,
    motorcycle_parking_included: false,
    key_money: 0,
    places: nil
  },
  {
    lat: 37.79252,
    lng: -122.43823,
    area: "Pacific Heights",
    sales_point: "Spectacular views!",
    price_per_month: 4500.0,
    minutes_to_station: 5.0,
    size: 101.0,
    beds: 1,
    rooms: 1,
    description: "One bedroom apartment",
    flat_type: "Flat",
    bath: 1.0,
    address1: "2415 Pierce St",
    city: "San Francisco",
    state: "California",
    zip: "94115",
    country: "United States of America",
    test_flat: false,
    parking_included: false,
    bicycle_parking_included: false,
    motorcycle_parking_included: false,
    key_money: 0,
    final_key_money: 0,
    places: nil
  }
]

buildings = [
  {
   name: "The Post Place Bldg",
   address1: "333 Post Street",
   city: "San Francisco",
   state: "CA",
   zip: "94108",
   country: "USA",
   construction: "SRC",
   year_built: 1970,
   last_renovation_year: 2000,
   units: 20,
   floors: 5,
   floors_underground: 1,
   language_code: 'en'
  }
]

bookings = [
  {
    date_start: "2020-03-01",
    date_end: "2020-03-31",
    booking_by_owner: false,
    final_rent: 5000.0,
    adjustments: nil,
    fees: nil,
    taxes: nil,
    total_price: nil,
    final_deposit: 2.0,
    paid: false,
    special_requests: nil,
    booking_by_ical: false,
    final_key_money: 0,
    booking_by_owner_notes: nil,
    booking_by_ical_notes: nil,
    signed: false,
    tenant_approved: false,
    parking_included: false,
    bicycle_parking_included: false,
    motorcycle_parking_included: false,
    storage_included: false,
    approved: true
  }
]

tenants = [
  {
    name: "斎藤猿の助",
    age: 11,
    phone: nil,
    email: nil,
    identification: nil,
    corporate_identification: nil
  },
  {
    name: "斎藤とりか",
    age: 5,
    phone: nil,
    email: nil,
    identification: nil,
    corporate_identification: nil
  }
]

contracts = [
  {
    work_type: "rental_broker",
    work_sub_type: "broker",
    contract_price: nil,
    total_price: nil,
    taxes: nil,
    fees: nil,
    adjustments: nil,
    paid: false,
    special_requests: nil,
    approved: false,
    contract_by_ical: false,
    contract_by_self: false,
    date_from: nil,
    date_to: nil
  }
]

assignments = [
  {
    staff_approved: false,
    staff_finished: false,
    finished: false,
    taxes: nil,
    fees: nil,
    adjustments: nil,
    total_pay: nil,
    paid: false,
    role: nil,
    leader: true,
    assignment_by_ical: false,
    assignment_by_self: false,
    date_from: nil,
    date_to: nil
  }
]
p "**************** Starting DB:Seed ********************"
p "Seeding Buildings"
building_count = 0
test_owner = nil
test_tenant = nil
buildings.each do |building|
  b = Building.new(
    name: building[:name],
    address1: building[:address1],
    city: building[:city],
    zip: building[:zip],
    country: building[:country],
    construction: building[:construction],
    year_built: building[:year_built],
    last_renovation_year: building[:last_renovation_year],
    units: building[:units],
    floors: building[:floors],
    floors_underground: building[:floors_underground]
  )
  b.save
  building_count += 1
end
p "Seeded " + building_count.to_s + " building(s)"

p "Seeding users"
user_count = 0
booking_count = 0
# test_owner to assign to test_flat
users.each do |user|
  new_user = User.new
  new_user.email = user[:email]
  new_user.password = user[:password]
  new_user.password_confirmation = user[:password_confirmation]
  new_user.email_confirmed = user[:email_confirmed]
  new_user.image = user[:image]
  new_user.save
  # assign test user to test flat
  test_owner = user[:test_owner] ? new_user.id : test_owner
  test_tenant = user[:test_tenant] ? new_user.id : test_tenant
  # p "test_tenant ternary " + test_tenant.to_s
  # p "test_owner ternary " + test_owner.to_s
  # p "new_user :test_owner? " + user[:test_owner].to_s
  # p "new_user :email? " + user[:email].to_s
  p "new_user id: " + new_user.id.to_s
  user_count += 1
  # p "user_count " + user_count.to_s
  if user[:profiles]
    user[:profiles].each do |profile|
    new_profile = Profile.new(
      image: profile[:image],
      name: profile[:name],
      title: profile[:title],
      first_name: profile[:first_name],
      middle_name: profile[:middle_name],
      last_name: profile[:last_name],
      username: profile[:username],
      address1: profile[:address1],
      address2: profile[:address2],
      city: profile[:city],
      state: profile[:state],
      zip: profile[:zip],
      country: profile[:country],
      language: profile[:language],
      birthday: profile[:birthday],
      phone: profile[:phone],
      emergency_contact_name: profile[:emergency_contact_name],
      emergency_contact_phone: profile[:emergency_contact_phone],
      introduction: profile[:introduction],
      language_code: profile[:language_code],
      corporation: profile[:corporation],
      user_id: new_user.id
    )
    new_profile.save
    end
  end
  if user[:contractors]
    base_record_iden = nil
    user[:contractors].each do |contractor|
      new_contractor = Contractor.new(
        user_id: new_user.id,
        contractor_type: contractor[:contractor_type],
        phone: contractor[:phone],
        company_name: contractor[:company_name],
        registration_number: contractor[:registration_number],
        registration_date: contractor[:registration_date],
        registration_jurisdiction: contractor[:registration_jurisdiction],
        registration_grantor: contractor[:registration_grantor],
        registration_number_front: contractor[:registration_number_front],
        first_name: contractor[:first_name],
        last_name: contractor[:last_name],
        address1: contractor[:address1],
        city: contractor[:city],
        state: contractor[:state],
        country: contractor[:country],
        language_code: contractor[:language_code],
      )

      base_record_iden = contractor[:base_record] ? nil : base_record_iden
      # p "contractor[:base_record] " + contractor[:base_record].to_s
      # p "base_record_iden " + base_record_iden.to_s
      new_contractor.base_record_id = base_record_iden
      new_contractor.save
      base_record_iden = contractor[:base_record] ? new_contractor.id : nil

      # p "********** constractor[:staffs] " + contractor[:staffs].to_s
      if contractor[:staffs]
        contractor[:staffs].each do |staff|
          new_staff = Staff.new(
            first_name: staff[:first_name],
            last_name: staff[:last_name],
            title: staff[:title],
            representative: staff[:representative],
            manager: staff[:manager],
            registration: staff[:registration],
            phone: staff[:phone],
            address1: staff[:address1],
            city: staff[:city],
            state: staff[:state],
            country: staff[:country],
            zip: staff[:zip],
            language_code: staff[:language_code],
            registration_jurisdiction: staff[:registration_jurisdiction],
            contractor_id: new_contractor.id
          )
          staff_base_record_id = staff[:base_record] ? nil : staff_base_record_id
          new_staff.base_record_id = staff_base_record_id
          new_staff.save
        end
      end
    end
    if user[:bank_accounts]
      user[:bank_accounts].each do |bank_account|
        new_bank_account = BankAccount.new(
          account_first_name: bank_account[:account_first_name],
          account_last_name: bank_account[:account_last_name],
          account_name: bank_account[:account_name],
          bank_name: bank_account[:bank_name],
          branch_name: bank_account[:branch_name],
          bank_address: bank_account[:bank_address],
          branch_number: bank_account[:branch_number],
          account_number: bank_account[:account_number],
          account_type: bank_account[:account_type],
          routing_number: bank_account[:routing_number],
          swift: bank_account[:swift],
          bank_name_english: bank_account[:bank_name_english],
          account_name_english: bank_account[:account_name_english]
        )
        new_bank_account.user_id = new_user.id
        new_bank_account.save
      end
    end
  end
end

p "Seeded " + user_count.to_s + " user(s)"

p "Seeding flats"
flat_count = 0
flats.each do |flat|
  # p "flat[:lat] " + flat[:lat].to_s
  # p "flat[:lng] " + flat[:lng].to_s
  p "flat[:address1] " + flat[:address1].to_s
  flat_building = Building.find_by(address1: flat[:address1])
  # p "Building.find_by(address1: flat[:address1]) " + Building.find_by(address1: flat[:address1]).to_s
  new_flat = Flat.new(
    lat: flat[:lat],
    lng: flat[:lng],
    area: flat[:area],
    price_per_month: flat[:price_per_month],
    sales_point: flat[:sales_point],
    description: flat[:description],
    minutes_to_station: flat[:minutes_to_station],
    rooms: flat[:rooms],
    size: flat[:size],
    beds: flat[:beds],
    flat_type: flat[:flat_type],
    bath: flat[:bath],
    address1: flat[:address1],
    city: flat[:city],
    state: flat[:state],
    zip: flat[:zip],
    country: flat[:country],
    parking_included: flat[:parking_included],
    bicycle_parking_included: flat[:bicycle_parking_included],
    motorcycle_parking_included: flat[:motorcycle_parking_included],
    key_money: flat[:key_money],
    user_id: flat[:test_flat] ? test_owner : Faker::Number::between(1, user_count),
    building_id: flat_building ? flat_building.id : nil
  )
  new_flat.save
  new_amenity = Amenity.new(amenity)
  new_amenity.flat_id = new_flat.id
  new_amenity.save
  image2 = Image.new(flat_id: new_flat.id, publicid: public_id_interior[Faker::Number::between(0,6)])
  image3 = Image.new(flat_id: new_flat.id, publicid: public_id_interior[Faker::Number::between(0,6)])
  image1 = Image.new(flat_id: new_flat.id, publicid: public_id_facade[Faker::Number::between(0,2)])
  image2.save
  image1.save
  image3.save
  if flat[:places]
    flat[:places].each do |place|
      new_place = Place.new(
        placeid: place[:placeid],
        place_name: place[:place_name],
        category: place[:category],
        lat: place[:lat],
        lng: place[:lng],
        distance: place[:distance],
        duration: place[:duration],
        language: place[:language],
        language_code: place[:language_code],
        flat_id: new_flat.id
      )
      new_place.save
    end
  end
  if flat[:flat_languages]
    flat[:flat_languages].each do |flat_language|
      new_flat_language = FlatLanguage.new(
        language_code: flat_language[:language_code],
        address1: flat_language[:address1],
        city: flat_language[:city],
        state: flat_language[:state],
        zip: flat_language[:zip],
        country: flat_language[:country],
        area: flat_language[:area],
        sales_point: flat_language[:sales_point],
        description: flat_language[:description],
        flat_type: flat_language[:flat_type],
        intro: flat_language[:intro],
        cancellation: flat_language[:cancellation],
        construction: flat_language[:construction],
        owner_name: flat_language[:owner_name],
        owner_contact_name: flat_language[:owner_contact_name],
        owner_address: flat_language[:owner_address],
        ownership_rights: flat_language[:ownership_rights],
        other_rights: flat_language[:other_rights],
        flat_id: new_flat.id
      )
      new_flat_language.save
    end
  end
  if flat[:facilities]
    flat[:facilities].each do |facility|
      new_facility = Facility.new(
        optional: facility[:optional],
        facility_type: facility[:facility_type],
        price_per_month: facility[:price_per_month],
        discount: facility[:discount],
        facility_number: facility[:facility_number],
        facility_deposit: facility[:facility_deposit],
        facility_key_money: facility[:facility_key_money],
        facility_management_fees: facility[:facility_management_fees],
        facility_format: facility[:facility_format],
        facility_broker_fees: facility[:facility_broker_fees],
        facility_name: facility[:facility_name],
        on_building_grounds: facility[:on_building_grounds],
        flat_id: new_flat.id
      )
      new_facility.save
    end
  end
  p "new_flat created id: " + new_flat.id.to_s
  # p "flat test_flat " + flat[:test_flat].to_s
  flat_count += 1
  # p "flat[:test_flat] " + flat[:test_flat].to_s
  if flat[:test_flat]
    # p "flat[:test_flat] " + flat[:test_flat].to_s
    # p "test_tenant " + test_tenant.to_s
    # p "test_owner " + test_owner.to_s
    booking_flat = Flat.find_by(user_id: test_owner)
    # p "booking_flat.id " + booking_flat.id.to_s
    # Start with just one booking to make easier
    bookings.each do |booking|
      # p "bookings " + booking.to_s
      new_booking = Booking.new(
        date_start: booking[:date_start],
        date_end: booking[:date_end],
        final_rent: booking[:final_rent],
        adjustments: booking[:adjustments],
        fees: booking[:fees],
        taxes: booking[:taxes],
        total_price: booking[:total_price],
        final_deposit: booking[:final_deposit],
        paid: booking[:paid],
        special_requests: booking[:special_requests],
        booking_by_ical: booking[:booking_by_ical],
        booking_by_owner: booking[:booking_by_owner],
        approved: booking[:approved],
      )
      new_booking = Booking.new(booking)

      new_booking.user_id = test_tenant
      new_booking.flat_id = Flat.find_by(user_id: test_owner) ? Flat.find_by(user_id: test_owner).id : Faker::Number::between(1,user_count)
      # p "new_booking new_booking flat_id, user_id " + new_booking.flat_id.to_s + ' ' + new_booking.user_id.to_s
      # p "new_booking new_booking date_start, date_end " + new_booking.date_start.to_s + ' ' + new_booking.date_end.to_s
      if new_booking.save
        booking_count += 1
        # p "new_booking created id, flat_id " + new_booking.id.to_s + ' ' + new_booking.flat_id.to_s
      end
      tenants.each do |tenant|
        new_tenant = Tenant.new(
          name: tenant[:name],
          age: tenant[:age],
          phone: tenant[:phone],
          email: tenant[:email],
          identification: tenant[:identification],
          corporate_identification: tenant[:corporate_identification],
        )
        new_tenant.booking_id = new_booking.id
        # p "******* test_tenant " + test_tenant.to_s
        new_tenant.user_id = User.find_by(id: test_tenant).id
        new_tenant.save
      end
      contracts.each do |contract|
        new_contract = Contract.new(
          work_type: contract[:rental_broker],
          work_sub_type: contract[:work_sub_type],
          contract_price: contract[:contract_price],
          total_price: contract[:total_price],
          taxes: contract[:taxes],
          fees: contract[:fees],
          adjustments: contract[:adjustments],
          paid: contract[:paid],
          special_requests: contract[:special_requests],
          approved: contract[:approved],
          contract_by_ical: contract[:contract_by_ical],
          contract_by_self: contract[:contract_by_self],
          date_from: contract[:date_from],
          date_to: contract[:date_to]
        )
        new_contract.flat_id = new_flat.id
        new_contract.booking_id = new_booking.id
        # p "******* contracts test_owner " + test_owner.to_s
        new_contract.contractor_id = Contractor.find_by(user_id: test_owner).id
        new_contract.save
        assignments.each do |assignment|
          new_assignment = Assignment.new(
            staff_approved: assignment[:staff_approved],
            staff_finished: assignment[:staff_finished],
            finished: assignment[:finished],
            taxes: assignment[:taxes],
            fees: assignment[:fees],
            adjustments: assignment[:adjustments],
            total_pay: assignment[:total_pay],
            paid: assignment[:paid],
            role: assignment[:role],
            leader: assignment[:leader],
            assignment_by_ical: assignment[:assignment_by_ical],
            assignment_by_self: assignment[:assignment_by_self],
            date_from: assignment[:date_from],
            date_to: assignment[:date_to]
          )
          new_assignment.contract_id = new_contract.id
          # p "******* staff find_by " + Staff.find_by(contractor_id: new_contract.contractor_id).to_s
          new_assignment.staff_id = Staff.find_by(contractor_id: new_contract.contractor_id).id
          new_assignment.save
        end
      end
      # end of contracts.each do
    end
  end
end
#end of if
p "Seeded " + flat_count.to_s + " flats"
p "Seeded " + user_count.to_s + " users"
p "Seeded " + booking_count.to_s + " booking(s)"
p "******************** Seeding complete!!!!! ************************"
