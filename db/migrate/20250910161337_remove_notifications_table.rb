class RemoveNotificationsTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :notifications if table_exists?(:notifications)
  end

  def down
    create_table :notifications do |t|
      t.string :recipient_type, null: false
      t.bigint :recipient_id, null: false
      t.string :type, null: false
      t.json :params
      t.datetime :read_at
      t.timestamps
    end
    
    add_index :notifications, [:recipient_type, :recipient_id]
    add_index :notifications, :read_at
  end
end
