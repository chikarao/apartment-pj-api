class Booking < ApplicationRecord

  # scope :take_out_booked, -> (range_start) { where("start_date = ?", range_start) }

  belongs_to :flat
  belongs_to :user

  has_one :review, dependent: :destroy
  has_many :facilities, dependent: :destroy
  has_many :tenants, dependent: :nullify
  has_many :contracts, dependent: :nullify
  has_many :contracted_users, through: :contracts, source: :user
  # has_many :agreements, dependent: :destroy
  has_many :agreements # destroy agreeemnts with no flat_id in cleanup below
  has_many :facility_bookings, dependent: :destroy

  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :user_id, presence: true

  after_destroy :cleanup

  private
  # after booking is destroyed, run clean up to destroy agreements that
  # have no flat_id; If have flat_id, need to keep the template
  def cleanup
    # if self.is_fired?
    if !self.agreements.empty?
      self.agreements.each do |each|
        unless each.flat_id
          each.destroy
        end
      end # end of self.agreement.each do |each|
    end # end of if !self.agreement.empty?
    # end # end of if self.is_fired?
  end # end of def cleanup

end
