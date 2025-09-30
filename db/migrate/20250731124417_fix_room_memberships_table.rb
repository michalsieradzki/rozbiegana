# rails generate migration FixRoomMembershipsTable
class FixRoomMembershipsTable < ActiveRecord::Migration[7.1]
  def change
    # Sprawdź czy kolumny już istnieją przed dodaniem
    unless column_exists?(:room_memberships, :room_id)
      add_reference :room_memberships, :room, null: false, foreign_key: true
    end
    
    unless column_exists?(:room_memberships, :user_id)
      add_reference :room_memberships, :user, null: false, foreign_key: true
    end
    
    unless column_exists?(:room_memberships, :role)
      add_column :room_memberships, :role, :integer, default: 0
    end
    
    unless column_exists?(:room_memberships, :last_read_at)
      add_column :room_memberships, :last_read_at, :datetime
    end
    
    # Sprawdź czy indeksy już istnieją
    unless index_exists?(:room_memberships, [:user_id, :room_id])
      add_index :room_memberships, [:user_id, :room_id], unique: true
    end
    
    unless index_exists?(:room_memberships, :role)
      add_index :room_memberships, :role
    end
  end
end
