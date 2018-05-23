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

ActiveRecord::Schema.define(version: 20180523071438) do

  create_table "amenities", force: :cascade do |t|
    t.integer "flat_id"
    t.boolean "auto_lock"
    t.boolean "security_system"
    t.boolean "wifi"
    t.boolean "pocket_wifi"
    t.boolean "iron"
    t.boolean "ac"
    t.boolean "heater"
    t.boolean "bath_essentials"
    t.boolean "hot_water"
    t.boolean "parking"
    t.boolean "tv"
    t.boolean "dvd_player"
    t.boolean "sofa"
    t.boolean "kitchen"
    t.boolean "dining_table"
    t.boolean "dish_washer"
    t.boolean "washer"
    t.boolean "dryer"
    t.boolean "cooking_basics"
    t.boolean "eating_utensils"
    t.boolean "microwave"
    t.boolean "refrigerator"
    t.boolean "oven"
    t.boolean "crib"
    t.boolean "high_chair"
    t.boolean "bath_tub"
    t.boolean "washlet"
    t.boolean "hairdryer"
    t.boolean "fire_extinguisher"
    t.boolean "lockbox"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["flat_id"], name: "index_conversations_on_flat_id"
    t.index ["user_id"], name: "index_conversations_on_user_id"
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

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.integer "content_rating"
    t.integer "recommend_rating"
    t.float "average_rating"
    t.integer "user_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.index ["book_id"], name: "index_reviews_on_book_id"
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
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
