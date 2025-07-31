class RemoveCompetitionFromActivities < ActiveRecord::Migration[7.1]
  def change
    remove_column :activities, :competition, :boolean
  end
end
