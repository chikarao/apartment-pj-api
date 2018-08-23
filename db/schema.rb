# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180823032631) do

  create_table "amenities", force: :cascade do |t|
    t.integer "flat_id"
    t.boolean "auto_lock", default: false
    t.boolean "security_system", default: false
    t.boolean "wifi", default: false
    t.boolean "pocket_wifi", default: false
    t.boolean "iron", default: false
    t.boolean "ac", default: false
    t.boolean "heater", default: false
    t.boolean "bath_essentials", default: false
    t.boolean "hot_water", default: false
    t.boolean "parking", default: false
    t.integer "parking_spaces", default: 0
    t.boolean "tv", default: false
    t.boolean "dvd_player", default: false
    t.boolean "cable_tv", default: false
    t.boolean "sofa", default: false
    t.boolean "kitchen", default: false
    t.boolean "dining_table", default: false
    t.boolean "dish_washer", default: false
    t.boolean "washer", default: false
    t.boolean "dryer", default: false
    t.boolean "cooking_basics", default: false
    t.boolean "eating_utensils", default: false
    t.boolean "microwave", default: false
    t.boolean "refrigerator", default: false
    t.boolean "oven", default: false
    t.boolean "crib", default: false
    t.boolean "high_chair", default: false
    t.boolean "bath_tub", default: false
    t.boolean "washlet", default: false
    t.boolean "hairdryer", default: false
    t.boolean "fire_extinguisher", default: false
    t.boolean "lockbox", default: false
    t.boolean "pool", default: false
    t.boolean "jacuzzi", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "basic", default: true
    t.boolean "wheelchair_accessible", default: false
    t.boolean "elevator", default: false
    t.boolean "washer_dryer_area", default: false
    t.boolean "bath_toilet_separate", default: false
    t.boolean "shower_bath_separate", default: false
    t.boolean "front_desk", default: false
    t.boolean "top_floor", default: false
    t.boolean "corner_flat", default: false
    t.boolean "first_floor", default: false
    t.boolean "pets_allowed", default: false
    t.index ["flat_id"], name: "index_amenities_on_flat_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "date_start"
    t.date "date_end"
    t.integer "flat_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_bookings_on_flat_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "image"
    t.string "author"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reviews_count", default: 0, null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "flat_id"
    t.date "date_start"
    t.date "date_end"
    t.integer "guests"
    t.integer "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "trashed", default: false
    t.boolean "deleted", default: false
    t.boolean "archived", default: false
    t.boolean "flagged", default: false
    t.boolean "starred", default: false
    t.boolean "important", default: false
    t.boolean "office", default: false
    t.index ["flat_id"], name: "index_conversations_on_flat_id"
    t.index ["user_id"], name: "index_conversations_on_user_id"
  end

  create_table "flat_languages", force: :cascade do |t|
    t.string "code"
    t.integer "flat_id"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "region"
    t.string "country"
    t.string "area"
    t.string "sales_point"
    t.string "description"
    t.string "flat_type"
    t.text "intro"
    t.string "cancellation"
    t.string "construction"
    t.string "school_district"
    t.string "school_district1"
    t.string "station"
    t.string "station1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_flat_languages_on_flat_id"
  end

  create_table "flats", force: :cascade do |t|
    t.integer "user_id"
    t.float "lat"
    t.float "lng"
    t.string "address1"
    t.string "city"
    t.string "zip"
    t.string "country"
    t.string "area"
    t.decimal "price_per_day", precision: 8, scale: 2
    t.decimal "price_per_month", precision: 8, scale: 2
    t.integer "guests"
    t.string "sales_point"
    t.text "description"
    t.integer "rooms"
    t.string "beds"
    t.string "flat_type"
    t.float "bath"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "intro"
    t.string "state"
    t.string "region"
    t.string "address2"
    t.string "cancellation"
    t.boolean "smoking"
    t.integer "king_or_queen_bed", default: 0
    t.float "size"
    t.float "balcony_size"
    t.string "station"
    t.float "minutes_to_station"
    t.string "station1"
    t.float "minutes_to_station1"
    t.integer "floor"
    t.float "deposit", default: 0.0
    t.float "key_money", default: 0.0
    t.integer "year_built", default: 0
    t.string "construction"
    t.float "management_fees", default: 0.0
    t.float "fees", default: 0.0
    t.boolean "parking_available"
    t.boolean "parking_included"
    t.float "parking_price", default: 0.0
    t.string "school_district"
    t.string "school_district1"
    t.boolean "circle_no_marker", default: false
    t.string "language_code", default: "en"
    t.index ["user_id"], name: "index_flats_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.integer "flat_id"
    t.string "publicid"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_images_on_flat_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "flat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_likes_on_flat_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "message_threads", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_flat_id"
    t.integer "booking_id_id"
    t.index ["booking_id_id"], name: "index_message_threads_on_booking_id_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "conversation_id"
    t.text "body"
    t.string "subject"
    t.boolean "read", default: false
    t.boolean "replied", default: false
    t.boolean "flag", default: false
    t.string "folder"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "sent_by_user"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
  end

  create_table "places", force: :cascade do |t|
    t.integer "flat_id"
    t.float "lat"
    t.float "lng"
    t.string "placeid"
    t.string "place_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.index ["flat_id"], name: "index_places_on_flat_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "image"
    t.string "identification"
    t.string "title"
    t.string "name"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "username"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "region"
    t.string "country"
    t.string "language"
    t.date "birthday"
    t.string "gender"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "flat_id"
    t.string "title"
    t.text "comment"
    t.float "rating"
    t.float "average_rating"
    t.boolean "review_for_flat", default: false
    t.boolean "review_for_user", default: false
    t.boolean "review_for_site", default: false
    t.integer "helpful"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "booking_id"
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["flat_id"], name: "index_reviews_on_flat_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.string "password"
    t.string "uid"
    t.string "provider"
    t.string "image"
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.string "swipe_customer_id"
    t.string "stripe_customer_id"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "views", force: :cascade do |t|
    t.integer "user_id"
    t.integer "flat_id"
    t.string "device"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_views_on_flat_id"
    t.index ["user_id"], name: "index_views_on_user_id"
  end

end
