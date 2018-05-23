class Conversation < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  has_many :messages
end
