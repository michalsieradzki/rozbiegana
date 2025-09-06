class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.text :description
      t.integer :room_type, default: 0
      t.json :settings, default: {}
      
      t.timestamps
    end
    
    add_index :rooms, :room_type
    add_index :rooms, :name, unique: true
  end
end
