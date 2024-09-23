class Message < ApplicationRecord
  belongs_to :user
  broadcasts_to ->(message) { "chat" }

  validates :content, presence: true
end
