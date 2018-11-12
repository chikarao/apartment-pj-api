class Contract < ApplicationRecord
  belongs_to :flat
  belongs_to :booking, optional: true
  belongs_to :contractor

  has_many :assignments, dependent: :destroy
  has_many :contracted_staffs, through: :assignments, source: :staff
end
