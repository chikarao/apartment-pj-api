class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :image, :identification, :title, :name, :first_name, :middle_name, :last_name, :username, :address1, :address2, :city, :state, :zip, :region, :country, :language, :birthday, :gender, :introduction, :created_at, :updated_at

  belongs_to :user
end
