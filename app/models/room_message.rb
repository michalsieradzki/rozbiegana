# app/models/room_message.rb
class RoomMessage < ApplicationRecord
  belongs_to :room
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 1000 }
  
  scope :recent, -> { order(created_at: :desc) }
  scope :for_display, -> { order(created_at: :asc) }
  
  after_create_commit :broadcast_to_room
  
  private
  
  def broadcast_to_room
    broadcast_append_to(
      "room_#{room.id}",
      target: "room_#{room.id}_messages",
      partial: "room_messages/message",
      locals: { message: self }
    )
  end
end

