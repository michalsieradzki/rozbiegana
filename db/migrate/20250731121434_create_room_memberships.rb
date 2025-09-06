class CreateRoomMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :room_memberships do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :role, default: 0
      t.datetime :last_read_at
      
      t.timestamps
    end
    
    add_index :room_memberships, [:user_id, :room_id], unique: true
    add_index :room_memberships, :role
  end
end
