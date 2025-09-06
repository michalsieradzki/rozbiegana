class CreateConversations < ActiveRecord::Migration[7.1]
  def change
    create_table :conversations do |t|
      t.references :sender, null: false, foreign_key: { to_table: :users }
      t.references :recipient, null: false, foreign_key: { to_table: :users }
      t.references :room, null: false, foreign_key: true
      
      t.timestamps
    end
    
    # Unikalne pary userów (niezależnie od kolejności)
    add_index :conversations, [:sender_id, :recipient_id], unique: true
    add_index :conversations, [:recipient_id, :sender_id], unique: true
  end
end
