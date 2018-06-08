class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :email_confirmed, :created_at, :updated_at, :current_sign_in_at, :last_sign_in_at, :profile
  has_one :profile
end
