class User < ApplicationRecord
  # email registration confirmation
  before_create :confirmation_token

  acts_as_token_authenticatable
  #for devise token auth
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :reviews, dependent: :delete_all

  has_many :flats
  has_many :bookings
  has_many :rented_flats, through: :bookings, source: :flat

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 def generate_new_authentication_token
   token = User.generate_unique_secure_token
   update_attributes authentication_token: token
 end

 def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    self.save
    # save!(:validate => false)
  end

 private

 def confirmation_token
  if self.confirm_token.blank?
    self.confirm_token = SecureRandom.urlsafe_base64.to_s
  end
 end
end
