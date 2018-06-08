class Flat < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :bookings
  has_many :booked_users, through: :bookings, source: :user
  has_many :conversations
  has_many :likes
  has_many :liking_users, :through => :likes, :source => :user
end
