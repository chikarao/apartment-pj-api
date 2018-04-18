class Flat < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :bookings
  has_many :tenants, through: :bookings, source: :user
end
