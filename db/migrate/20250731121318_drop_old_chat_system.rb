class DropOldChatSystem < ActiveRecord::Migration[7.1]
  def change
    drop_table :messages if table_exists?(:messages)
  end
end
