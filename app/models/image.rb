class Image < ApplicationRecord
  belongs_to :flat
  validates :publicid, presence: true
  validates :flat_id, presence: true
end
