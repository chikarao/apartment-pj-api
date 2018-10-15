class Booking < ApplicationRecord

  # scope :take_out_booked, -> (range_start) { where("start_date = ?", range_start) }

  belongs_to :flat
  belongs_to :user

  has_one :review, dependent: :destroy
  has_many :facilities, dependent: :nullify

  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :user_id, presence: true
end
