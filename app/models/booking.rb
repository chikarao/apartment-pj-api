class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  has_one :review, dependent: :destroy

  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :user_id, presence: true
end
