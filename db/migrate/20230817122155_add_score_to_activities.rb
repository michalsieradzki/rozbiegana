class AddScoreToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :score, :float
  end
end
