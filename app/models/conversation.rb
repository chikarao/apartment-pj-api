class Conversation < ApplicationRecord
  belongs_to :user
  belongs_to :flat

#  after_create_commit do
#   ChatMessageCreationEventBroadcastJob.perform_later(self)
#  end

  has_many :messages, dependent: :destroy
end
