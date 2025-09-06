class Conversation < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  belongs_to :room
  
  validates :sender_id, uniqueness: { scope: :recipient_id }
  validate :sender_and_recipient_are_different
  
  scope :involving, ->(user) {
    where("sender_id = ? OR recipient_id = ?", user.id, user.id)
  }
  
  scope :between, ->(user1, user2) {
    where(
      "(sender_id = ? AND recipient_id = ?) OR (sender_id = ? AND recipient_id = ?)",
      user1.id, user2.id, user2.id, user1.id
    )
  }
  
  def self.find_or_create_between(user1, user2)
    conversation = between(user1, user2).first
    
    return conversation if conversation
    
    ActiveRecord::Base.transaction do
      room = Room.create!(
        name: "#{user1.username} & #{user2.username}",
        description: "Prywatna rozmowa",
        room_type: :direct_message
      )
      
      # Dodaj obu userów do pokoju
      room.room_memberships.create!(user: user1)
      room.room_memberships.create!(user: user2)
      
      # Stwórz konwersację
      create!(
        sender: user1,
        recipient: user2,
        room: room
      )
    end
  end
  
  def other_user(current_user)
    sender == current_user ? recipient : sender
  end
  
  def display_name(current_user)
    other_user(current_user).username
  end
  
  def last_message
    room.room_messages.order(created_at: :desc).first
  end
  
  private
  
  def sender_and_recipient_are_different
    errors.add(:recipient, "nie może być taki sam jak nadawca") if sender_id == recipient_id
  end
end