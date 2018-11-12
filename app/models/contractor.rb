class Contractor < ApplicationRecord
  belongs_to :user

  has_many :staffs
end
