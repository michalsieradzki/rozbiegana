# app/models/room_membership.rb
class RoomMembership < ApplicationRecord
  belongs_to :room
  belongs_to :user
  
  enum role: {
    member: 0,
    moderator: 1,
    room_admin: 2  # zmienione z 'admin' na 'room_admin'
  }
  
  validates :user_id, uniqueness: { scope: :room_id }
  
  scope :active, -> { joins(:user).merge(User.active) }
end
