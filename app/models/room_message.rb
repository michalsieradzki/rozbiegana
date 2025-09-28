# app/models/room_message.rb
class RoomMessage < ApplicationRecord
  belongs_to :room
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 1000 }
  
  scope :recent, -> { order(created_at: :desc) }
  scope :for_display, -> { order(created_at: :asc) }
  
  after_create_commit :broadcast_to_room
  after_create_commit :notify_room_members
  
  private
  
  def broadcast_to_room
    broadcast_append_to(
      "room_#{room.id}",
      target: "room_#{room.id}_messages",
      partial: "room_messages/message",
      locals: { message: self }
    )
  end

  def notify_room_members
    # Powiadom członków pokoju o nowej wiadomości (oprócz autora)
    room.room_memberships.includes(:user).each do |membership|
      next if membership.user_id == user_id # Nie powiadamiaj autora
      
      Notification.create_for_user(
        membership.user,
        "Nowa wiadomość w #{room.name}",
        "#{user.username}: #{content.truncate(50)}",
        'info',
        { notification_key: 'chat_messages' }
      )
    end
  end

end

