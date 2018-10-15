class Facility < ApplicationRecord
  belongs_to :flat
  belongs_to :booking, optional: true
end
