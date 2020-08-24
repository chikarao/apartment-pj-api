class BankAccount < ApplicationRecord
  belongs_to :user
  # IMORTANT!!! DO NOT destory dependents flats; just nullify building_id in flat
  has_many :flats, dependent: :nullify
end
