class Flat < ApplicationRecord
  belongs_to :user
  belongs_to :building, optional: true
  belongs_to :bank_account, optional: true
  has_many :images, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :booked_users, through: :bookings, source: :user
  has_many :conversations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liking_users, :through => :likes, :source => :user
  has_one :amenity, dependent: :destroy
  has_many :places, dependent: :destroy
  has_many :views, dependent: :destroy
  has_many :flat_languages, dependent: :destroy
  has_many :calendars, dependent: :destroy
  # has_many :reviews
end
