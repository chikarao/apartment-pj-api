class Facility < ApplicationRecord
  belongs_to :flat, optional: true
  belongs_to :booking, optional: true
end
