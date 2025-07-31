class AddCompetitionToActivities < ActiveRecord::Migration[7.1]
  def change
    add_reference :activities, :competition, null: true, foreign_key: true
    
    reversible do |dir|
      dir.up do
        competition = Competition.create!(
          name: "Konkurs #{Date.current.strftime('%B %Y')}",
          description: "Miesięczny konkurs punktowy",
          competition_type: 'points',
          start_date: Date.current.beginning_of_month,
          end_date: Date.current.end_of_month,
          is_main: true
        )

        Activity.where(created_at: Date.current.beginning_of_month..Date.current.end_of_month)
                .update_all(competition_id: competition.id)
      end
    end
  end
end
