class Staff < ApplicationRecord
  belongs_to :contractor
  belongs_to :user, optional: true
  has_many :assignments, dependent: :nullify
end
