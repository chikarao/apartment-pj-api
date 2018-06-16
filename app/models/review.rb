class Review < ApplicationRecord
  belongs_to :user
  # belongs_to :flat

  belongs_to :booking
end
