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
  has_many :conversations, dependent: :destroy
  has_many :likes
  has_many :liked_flats, :through => :likes, :source => :flat
  has_one :profile

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

# auth token for sign up and saved in local storage on the front end; matched at sign in and auth required api requests
 def generate_new_authentication_token
   token = User.generate_unique_secure_token
   update_attributes authentication_token: token
 end

# called in users controller in email regisistration confirmation when user clicks on email link
 def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!
    # save!(:validate => false)
    # validate for password validation, done on front end
 end

 def generate_password_token!
   self.reset_password_token = generate_token
   self.reset_password_sent_at = Time.now.utc
   save!
 end

 def password_token_valid?
   (self.reset_password_sent_at + 48.hours) > Time.now.utc
 end

 def reset_password!(password)
   self.reset_password_token = nil
   self.password = password
   save!
 end

 private
# confirm_token for generating a token at sign up to be sent in a link in user_registration_confirmation email
 def confirmation_token
  if self.confirm_token.blank?
    self.confirm_token = SecureRandom.urlsafe_base64.to_s
  end
 end

 def generate_token
   SecureRandom.hex(10)
 end
end
