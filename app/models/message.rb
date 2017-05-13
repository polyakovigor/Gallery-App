class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  default_scope { order(:created_at) }

  validates :body, presence: true, length: { minimum: 2, maximum: 1000 }
  validates :user,:chat_room, presence: true

  after_create_commit { MessageBroadcastJob.perform_later(self) }

end
