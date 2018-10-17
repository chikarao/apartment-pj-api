class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :image, :email_confirmed, :stripe_customer_id, :last_sign_in_ip, :current_sign_in_ip, :created_at, :updated_at, :current_sign_in_at, :last_sign_in_at, :profile, :conversations
  has_one :profile
  has_many :conversations
  has_many :flats
  has_many :bookings
end
