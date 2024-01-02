class ChangeDistanceToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :activities, :distance, :float
  end
end
