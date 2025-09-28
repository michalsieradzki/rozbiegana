class AddIsOfficialToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :is_official, :boolean, default: false
  end
end
