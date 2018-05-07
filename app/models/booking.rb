class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  validates :date_start, presence: true
  validates :date_start, presence: true
  validates :user_id, presence: true
end
