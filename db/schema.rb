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

ActiveRecord::Schema.define(version: 20200217021606) do

  create_table "agreements", force: :cascade do |t|
    t.integer "booking_id"
    t.integer "flat_id"
    t.string "document_publicid"
    t.string "document_name"
    t.boolean "tenant_signed"
    t.boolean "owner_signed"
    t.boolean "contractor_signed"
    t.boolean "sent_to_tenant"
    t.boolean "owner_approved"
    t.boolean "tenant_approved"
    t.boolean "contractor_approved"
    t.string "language_code"
    t.string "language_code_1"
    t.string "template_file_name"
    t.string "document_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "document_pages"
    t.string "document_type"
    t.index ["booking_id"], name: "index_agreements_on_booking_id"
    t.index ["flat_id"], name: "index_agreements_on_flat_id"
  end

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
    t.boolean "shower", default: false
    t.boolean "wash_basin", default: false
    t.boolean "kitchen_grill", default: false
    t.boolean "lighting_fixed", default: false
    t.boolean "internet_ready", default: false
    t.boolean "mail_box", default: false
    t.boolean "parcel_delivery_box", default: false
    t.boolean "lock_key", default: false
    t.index ["flat_id"], name: "index_amenities_on_flat_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.integer "contract_id"
    t.integer "staff_id"
    t.boolean "staff_approved", default: false
    t.boolean "staff_finished", default: false
    t.boolean "finished", default: false
    t.decimal "taxes", precision: 8, scale: 2
    t.decimal "fees", precision: 8, scale: 2
    t.decimal "adjustments", precision: 8, scale: 2
    t.decimal "total_pay", precision: 8, scale: 2
    t.boolean "paid", default: false
    t.string "role"
    t.boolean "leader", default: false
    t.boolean "assignment_by_ical", default: false
    t.boolean "assignment_by_self", default: false
    t.datetime "date_from"
    t.datetime "date_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_assignments_on_contract_id"
    t.index ["staff_id"], name: "index_assignments_on_staff_id"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.integer "user_id"
    t.string "account_first_name"
    t.string "account_last_name"
    t.string "account_name"
    t.string "bank_name"
    t.string "branch_name"
    t.string "bank_address"
    t.string "branch_number"
    t.string "account_number"
    t.string "account_type"
    t.string "routing_number"
    t.string "swift"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bank_name_english"
    t.string "account_name_english"
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "date_start"
    t.date "date_end"
    t.integer "flat_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "booking_by_owner", default: false
    t.boolean "approved", default: false
    t.float "final_rent"
    t.float "adjustments"
    t.float "fees"
    t.float "taxes"
    t.float "total_price"
    t.float "final_deposit"
    t.boolean "paid", default: false
    t.text "special_requests"
    t.boolean "booking_by_ical", default: false
    t.float "final_key_money"
    t.string "booking_by_owner_notes"
    t.string "booking_by_ical_notes"
    t.boolean "signed", default: false
    t.boolean "tenant_approved", default: false
    t.boolean "parking_included", default: false
    t.boolean "bicycle_parking_included", default: false
    t.boolean "motorcycle_parking_included", default: false
    t.boolean "storage_included", default: false
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

  create_table "building_languages", force: :cascade do |t|
    t.integer "building_id"
    t.string "name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "region"
    t.string "country"
    t.string "construction"
    t.string "building_type"
    t.string "building_management_company"
    t.string "building_management_contact"
    t.text "asbestos_survey_contents"
    t.text "earthquake_study_contents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language_code"
    t.string "building_owner_name"
    t.string "building_owner_address"
    t.string "legal_restrictions"
    t.text "legal_restrictions_summary"
    t.string "electricity"
    t.string "building_management_address"
    t.index ["building_id"], name: "index_building_languages_on_building_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "region"
    t.string "country"
    t.string "construction"
    t.string "type"
    t.integer "year_built"
    t.integer "last_renovation_year"
    t.integer "units"
    t.integer "floors"
    t.integer "floors_underground"
    t.integer "power_usage_amount"
    t.string "gas"
    t.string "water"
    t.string "sewage"
    t.string "building_management_company"
    t.string "building_management_phone"
    t.string "building_management_contact"
    t.boolean "building_inspection_conducted"
    t.boolean "inside_disaster_prevention"
    t.boolean "inside_disaster_warning"
    t.boolean "inside_tsunami_warning"
    t.boolean "asbestos_record"
    t.text "asbestos_survey_contents"
    t.boolean "earthquake_study_performed"
    t.text "earthquake_study_contents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "building_owner_name"
    t.string "building_owner_address"
    t.string "building_owner_phone"
    t.string "building_type"
    t.string "language_code"
    t.string "legal_restrictions"
    t.text "legal_restrictions_summary"
    t.string "electricity"
    t.string "building_management_address"
  end

  create_table "calendars", force: :cascade do |t|
    t.string "ical_url"
    t.integer "flat_id"
    t.string "name"
    t.datetime "last_updated_calendar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_calendars_on_flat_id"
  end

  create_table "contractors", force: :cascade do |t|
    t.integer "user_id"
    t.string "contractor_type"
    t.string "contractor_sub_type"
    t.string "contractor_sales_heading"
    t.string "contractor_intro"
    t.decimal "price", precision: 8, scale: 2
    t.float "price_range"
    t.string "days_closed"
    t.integer "time_from"
    t.integer "time_to"
    t.string "specialty"
    t.string "phone"
    t.string "mobile"
    t.string "email"
    t.string "company_name"
    t.string "registration_number"
    t.string "registration_type"
    t.date "registration_date"
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "stamp"
    t.string "fax"
    t.string "facebook"
    t.string "twitter"
    t.string "line"
    t.string "image"
    t.string "url"
    t.float "lat"
    t.float "lng"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "zip"
    t.string "state"
    t.string "region"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language_code"
    t.integer "base_record_id"
    t.string "registration_jurisdiction"
    t.string "registration_grantor"
    t.string "registration_number_front"
    t.string "bond_deposit_office"
    t.string "bond_deposit_office_address"
    t.string "guaranty_association_name"
    t.string "guaranty_association_address"
    t.string "guaranty_association_office_address"
    t.index ["user_id"], name: "index_contractors_on_user_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.integer "flat_id"
    t.integer "booking_id"
    t.integer "contractor_id"
    t.string "work_type"
    t.string "work_sub_type"
    t.decimal "contract_price", precision: 8, scale: 2
    t.decimal "total_price", precision: 8, scale: 2
    t.decimal "taxes", precision: 8, scale: 2
    t.decimal "fees", precision: 8, scale: 2
    t.decimal "adjustments", precision: 8, scale: 2
    t.boolean "paid", default: false
    t.text "special_requests"
    t.boolean "approved", default: false
    t.boolean "contract_by_ical", default: false
    t.boolean "contract_by_self", default: false
    t.datetime "date_from"
    t.datetime "date_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_contracts_on_booking_id"
    t.index ["contractor_id"], name: "index_contracts_on_contractor_id"
    t.index ["flat_id"], name: "index_contracts_on_flat_id"
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
    t.boolean "deleted_by_user", default: false
    t.boolean "trashed_by_user", default: false
    t.boolean "starred_by_user", default: false
    t.boolean "flagged_by_user", default: false
    t.boolean "important_by_user", default: false
    t.boolean "archived_by_user", default: false
    t.index ["flat_id"], name: "index_conversations_on_flat_id"
    t.index ["user_id"], name: "index_conversations_on_user_id"
  end

  create_table "document_fields", force: :cascade do |t|
    t.integer "agreement_id"
    t.string "val"
    t.string "value"
    t.string "enclosed_text"
    t.string "top"
    t.string "left"
    t.string "height"
    t.string "font_style"
    t.string "font_size"
    t.string "font_color"
    t.string "font"
    t.string "border_color"
    t.string "border_width"
    t.string "border_style"
    t.boolean "underline"
    t.boolean "italic"
    t.string "background_color"
    t.string "margin"
    t.string "class_name"
    t.string "class_name_1"
    t.string "component_type"
    t.string "component_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "text_align"
    t.string "input_type"
    t.integer "page"
    t.string "width"
    t.string "display_text"
    t.string "font_family"
    t.string "component"
    t.string "font_weight"
    t.index ["agreement_id"], name: "index_document_fields_on_agreement_id"
  end

  create_table "document_inserts", force: :cascade do |t|
    t.integer "agreement_id"
    t.string "publicid"
    t.text "result"
    t.boolean "main_agreement", default: true
    t.integer "insert_after_page"
    t.integer "pages"
    t.integer "from_page"
    t.integer "to_page"
    t.string "insert_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agreement_id"], name: "index_document_inserts_on_agreement_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.integer "flat_id"
    t.integer "booking_id"
    t.boolean "optional"
    t.string "facility_type"
    t.float "price_per_month"
    t.float "discount"
    t.string "facility_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "facility_deposit"
    t.float "facility_key_money"
    t.float "facility_management_fees"
    t.string "facility_format"
    t.float "facility_broker_fees"
    t.string "facility_name"
    t.boolean "on_building_grounds", default: true
    t.index ["booking_id"], name: "index_facilities_on_booking_id"
    t.index ["flat_id"], name: "index_facilities_on_flat_id"
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
    t.string "owner_name"
    t.string "owner_contact_name"
    t.string "owner_address"
    t.string "language_code"
    t.text "ownership_rights"
    t.text "other_rights"
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
    t.string "ical_import_url"
    t.string "ical_export_url"
    t.boolean "snoozing", default: false
    t.boolean "approval_required", default: true
    t.integer "min_stay"
    t.integer "max_stay"
    t.string "block"
    t.string "unit"
    t.string "flat_building_name"
    t.integer "building_id"
    t.string "layout"
    t.boolean "bicycle_parking_included"
    t.boolean "storage_included"
    t.boolean "motorcycle_parking_included"
    t.boolean "dedicated_yard"
    t.string "toilet"
    t.float "floor_area_official"
    t.string "owner_name"
    t.string "owner_contact_name"
    t.string "owner_address"
    t.string "owner_phone"
    t.integer "payment_due_date"
    t.integer "bank_account_id"
    t.string "transfer_fee_paid_by"
    t.string "rent_payment_method"
    t.integer "management_fee_due_date"
    t.text "ownership_rights"
    t.text "other_rights"
    t.index ["bank_account_id"], name: "index_flats_on_bank_account_id"
    t.index ["building_id"], name: "index_flats_on_building_id"
    t.index ["user_id"], name: "index_flats_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.integer "flat_id"
    t.string "publicid"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "caption"
    t.string "comment"
    t.index ["flat_id"], name: "index_images_on_flat_id"
  end

  create_table "insert_fields", force: :cascade do |t|
    t.integer "document_insert_id"
    t.string "name"
    t.text "value"
    t.string "language_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_insert_id"], name: "index_insert_fields_on_document_insert_id"
  end

  create_table "inspections", force: :cascade do |t|
    t.integer "building_id"
    t.datetime "inspection_date"
    t.text "inspection_summary"
    t.string "inspector_name"
    t.string "inspector_trainer"
    t.string "inspector_certificate_number"
    t.string "architect_qualification_type"
    t.string "architect_type"
    t.string "architect_registration_number"
    t.string "architect_registration_type"
    t.string "architect_office_name"
    t.string "architect_office_registration"
    t.string "foundation"
    t.string "floor_assembly"
    t.string "floor"
    t.string "pillars"
    t.string "exterior_walls"
    t.string "balcony"
    t.string "interior_walls"
    t.string "ceilings"
    t.string "roof_truss"
    t.string "termite_damage"
    t.string "corrosion"
    t.string "reinforcement"
    t.string "concrete_compression"
    t.string "exterior_walls_rain"
    t.string "eaves_rain"
    t.string "balcony_rain"
    t.string "interior_walls_rain"
    t.string "ceilings_rain"
    t.string "roof_truss_rain"
    t.string "roof"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "inspection_language"
    t.string "language_code"
    t.string "architect_office_registration_jurisdiction"
    t.string "architect_registration_jurisdiction"
    t.string "halls"
    t.index ["building_id"], name: "index_inspections_on_building_id"
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
    t.integer "distance"
    t.integer "duration"
    t.string "language", default: "en"
    t.string "address"
    t.string "image"
    t.integer "image_height"
    t.integer "image_width"
    t.string "icon"
    t.string "vicinity"
    t.string "hours"
    t.string "language_code"
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
    t.string "phone"
    t.string "emergency_contact_name"
    t.string "emergency_contact_address"
    t.string "emergency_contact_phone"
    t.string "emergency_contact_relationship"
    t.boolean "corporation", default: false
    t.string "contact_name"
    t.string "language_code"
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
    t.string "language_code"
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["flat_id"], name: "index_reviews_on_flat_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.integer "contractor_id"
    t.integer "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "identification"
    t.string "tax_identification"
    t.date "birthday"
    t.string "title"
    t.string "division"
    t.string "group"
    t.boolean "representative", default: false
    t.boolean "manager", default: false
    t.decimal "salary", precision: 8, scale: 2
    t.decimal "bonus", precision: 8, scale: 2
    t.float "bonus_months"
    t.string "contract"
    t.string "registration"
    t.string "registration_type"
    t.string "stamp"
    t.string "mobile"
    t.string "phone"
    t.string "fax"
    t.string "email"
    t.string "line"
    t.float "lat"
    t.float "lng"
    t.string "location_name"
    t.string "location_number"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "region"
    t.string "country"
    t.string "calendar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "zip"
    t.string "language_code"
    t.integer "base_record_id"
    t.string "registration_jurisdiction"
    t.string "registration_number"
    t.string "staff_number"
    t.index ["contractor_id"], name: "index_staffs_on_contractor_id"
    t.index ["user_id"], name: "index_staffs_on_user_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.integer "user_id"
    t.integer "booking_id"
    t.string "name"
    t.integer "age"
    t.string "phone"
    t.string "email"
    t.string "identification"
    t.string "corporate_identification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_tenants_on_booking_id"
    t.index ["user_id"], name: "index_tenants_on_user_id"
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
