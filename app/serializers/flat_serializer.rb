class FlatSerializer < ActiveModel::Serializer
  include DocumentFieldsMethod

  attributes :id,
  :user_id,
  :lat,
  :lng,
  :unit,
  :address1,
  :city,
  :zip,
  :country,
  :area,
  :price_per_day,
  :price_per_month,
  :guests,
  :sales_point,
  :description,
  :rooms,
  :beds,
  :king_or_queen_bed,
  :flat_type,
  :bath,
  :toilet,
  :intro,
  :state,
  :region,
  :address2,
  :deposit,
  :key_money,
  :management_fees,
  :fees,
  :cancellation,
  :smoking,
  :size,
  :floor_area_official,
  :station,
  :minutes_to_station,
  :station1,
  :minutes_to_station1,
  :parking_included,
  :bicycle_parking_included,
  :storage_included,
  :motorcycle_parking_included,
  :dedicated_yard,
  :year_built,
  :layout,
  :balcony_size,
  :language_code,
  :payment_due_date,
  :owner_name,
  :owner_contact_name,
  :owner_address,
  :owner_phone,
  :images,
  :user,
  :likes,
  :amenity,
  :views,
  :places,
  :flat_languages,
  :calendars,
  :bank_account,
  :building,
  :facilities,
  :created_at,
  :updated_at,
  :transfer_fee_paid_by,
  :rent_payment_method,
  :management_fee_due_date,
  :contracts,
  :ownership_rights,
  :other_rights,
  :agreements
# :building,
#:bank_account,
  # :total_reviews
  # :average_rating_of_book,
  # :content_rating_of_book, :recommend_rating_of_book,

  has_many :images
  has_many :bookings
  has_many :facilities
  has_many :likes
  belongs_to :user
  has_one :amenity
  has_many :views
  has_many :places
  has_many :flat_languages
  has_many :calendars
  has_many :contracts
  belongs_to :building, optional: true

  def agreements
    # Return hash object of document_field_translations mapped; Nil if no document_field_translations
    obj = nil
    # Object is a DocumentField instance
    if !object.agreements.empty?
      obj = {}
      # p "In document_field_serializer in def: " + object.to_s
      # object is a DocumentField instance
      object.agreements.each do |each|
        custom_each = each.attributes
        custom_each[:document_fields] = document_fields_method(each)
        # put them in a hash like { en: each, jp: each }
        obj[each.id] = custom_each
      end
    end # end of if !object.document_field_translations.empty?
    return obj
  end # End of function

  # def document_fields(agreement)
  #   # Return array of document_fields
  #   array = []
  #   # Object is an agreement instance; Go through each document field to get
  #   # document field choices if any and put them in a hash object mapped by index
  #   if agreement.document_fields
  #     agreement.document_fields.each do |eachDF|
  #       custom_document_field = eachDF.attributes
  #       # p "In agreement_serializer in def　custom_document_field: " + custom_document_field.to_s
  #       obj = nil
  #
  #       # document_field_choices section
  #       if !eachDF.document_field_choices.empty?
  #         # if there are document_field_choices put them in a mapped hash object { 0 => object, 1 => object }
  #         obj = {}
  #         eachDF.document_field_choices.each_with_index do |each,  i|
  #           # get all attributes of each document_field_choices in a new object hash
  #           custom_each = each.attributes
  #           # select_choices nil if there are no select_choices
  #           # else put thim in a mapped hash object inside document_field_choices object
  #           custom_each["select_choices"] = nil
  #           if !each.select_choices.empty?
  #             custom_each["select_choices"] = {}
  #             each.select_choices.each_with_index do |each_select, i|
  #               custom_each["select_choices"][i] = each_select
  #             end
  #           end
  #           # obj[i] = each
  #           obj[i] = custom_each
  #         end # end of each
  #         custom_document_field["document_field_choices"] = obj
  #       else # else of if !eachDF.document_field_choices.empty?
  #         custom_document_field["document_field_choices"] = nil
  #       end # end of if document_field_choices empty
  #
  #       # document_field_translations section
  #       if !eachDF.document_field_translations.empty?
  #         custom_document_field["document_field_translations"] = {}
  #         eachDF.document_field_translations.each do |each|
  #           custom_each_translation = each.attributes
  #           # map hash to language_code
  #           custom_document_field["document_field_translations"][each.language_code] = custom_each_translation
  #         end # end of eachDF.document_field_choices.each do |each|
  #       else # else of if !eachDF.document_field_translations.empty?
  #         custom_document_field["document_field_translations"] = nil
  #       end # end of   if !eachDF.document_field_translations.empty?
  #
  #       array.push(custom_document_field)
  #     end # end of agreement.document_fields.each do |eachDF|
  #   end # end of if object.document_fields
  #
  #   return array
  # end # end of function

  # has_many :conversations
  # has_many :reviews
  # has_many :conversations
  #
  # def average_rating_of_book
  #   object.reviews.count == 0 ? 0 : object.reviews.average(:average_rating).round(1)
  # end
  # def content_rating_of_book
  #   object.reviews.count == 0 ? 0 : object.reviews.average(:content_rating).round(1)
  # end
  # def recommend_rating_of_book
  #   object.reviews.count == 0 ? 0 : object.reviews.average(:recommend_rating).round(1)
  # end

  # def total_reviews
  #   object.reviews_count
  #   #instead of .reviews.count using counter culture
  # end
end
