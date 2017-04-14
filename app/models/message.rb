class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :body, presence: true, length: { minimum: 2, maximum: 1000 }

  after_create_commit { MessageBroadcastJob.perform_later(self) }
  # The after_create_commit hook means that a job will be executed once the message has been successfully saved into the database.
  # perform_later means that the job will be executed as soon as the queue is empty.


  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
