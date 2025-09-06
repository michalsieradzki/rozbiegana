# rails generate migration FixRoomMembershipsTable
class FixRoomMembershipsTable < ActiveRecord::Migration[7.1]
  def change
    add_reference :room_memberships, :room, null: false, foreign_key: true
    add_reference :room_memberships, :user, null: false, foreign_key: true
    add_column :room_memberships, :role, :integer, default: 0
    add_column :room_memberships, :last_read_at, :datetime
    
    add_index :room_memberships, [:user_id, :room_id], unique: true
    add_index :room_memberships, :role
  end
end
