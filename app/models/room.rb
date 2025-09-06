# app/models/room.rb
class Room < ApplicationRecord
  has_many :room_messages, dependent: :destroy
  has_many :room_memberships, dependent: :destroy
  has_many :users, through: :room_memberships
  has_one :conversation, dependent: :destroy
  
  enum room_type: {
    general: 0,
    admin_announce: 1,
    admin_only: 2,
    direct_message: 3
  }
  
  validates :name, presence: true, uniqueness: true
  validates :room_type, presence: true
  
  scope :public_rooms, -> { where(room_type: [:general, :admin_announce, :admin_only]) }
  scope :accessible_by, ->(user) {
    if user.admin?
      public_rooms
    else
      where(room_type: [:general, :admin_announce])
    end
  }
  
  def can_write?(user)
    case room_type
    when 'general'
      true
    when 'admin_announce', 'admin_only'
      user.admin?
    when 'direct_message'
      users.include?(user)
    else
      false
    end
  end
  
  def can_read?(user)
    case room_type
    when 'general', 'admin_announce'
      true
    when 'admin_only'
      user.admin?
    when 'direct_message'
      users.include?(user)
    else
      false
    end
  end

  def private_chat?
    direct_message?
  end
  
  def participants
    return users if private_chat?
    users # dla publicznych pokoi
  end
end
