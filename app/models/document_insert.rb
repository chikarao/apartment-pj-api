class DocumentInsert < ApplicationRecord
  belongs_to :agreement

  has_many :insert_fields
end
