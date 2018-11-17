class UserSerializer < ActiveModel::Serializer
  attributes :id,
  :email,
  :image,
  :email_confirmed,
  :stripe_customer_id,
  :last_sign_in_ip,
  :current_sign_in_ip,
  :created_at,
  :updated_at,
  :current_sign_in_at,
  :last_sign_in_at,
  :profiles,
  :conversations,
  :contractors

  has_many :profiles
  has_many :conversations
  has_many :flats
  has_many :bookings
  has_many :contractors
end
