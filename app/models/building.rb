class Building < ApplicationRecord
  # Do NOT destory dependents flats
  has_many :flats

end
