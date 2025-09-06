class CreateRoomMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :room_messages do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content, null: false
      
      t.timestamps
    end
    
    add_index :room_messages, [:room_id, :created_at]
  end
end
