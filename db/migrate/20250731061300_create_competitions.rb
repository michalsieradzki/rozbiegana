class CreateCompetitions < ActiveRecord::Migration[7.1]
  def change
    create_table :competitions do |t|
      t.string :name, null: false
      t.text :description
      t.string :competition_type, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.boolean :is_main, default: false
      t.boolean :is_active, default: true
      t.float :points_multiplier, default: 1.0
      t.json :rules

      t.timestamps
    end

    add_index :competitions, [:start_date, :end_date]
    add_index :competitions, :competition_type
    add_index :competitions, :is_main
  end
end
