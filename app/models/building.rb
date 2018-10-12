class Building < ApplicationRecord
  # Do NOT destory dependents flats; just nullify building_id in flat
  has_many :flats, dependent: :nullify
end
