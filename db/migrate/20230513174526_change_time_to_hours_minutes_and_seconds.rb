class ChangeTimeToHoursMinutesAndSeconds < ActiveRecord::Migration[7.0]
  def change
    remove_column :activities, :time
    add_column :activities, :hours, :integer
    add_column :activities, :minutes, :integer
    add_column :activities, :seconds, :integer
  end
end
