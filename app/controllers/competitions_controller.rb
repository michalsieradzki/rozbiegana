class CompetitionsController < ApplicationController
  def index
    @users = User.joins(:activities, :team)
    .where('DATE_PART(\'month\', activities.created_at) = ?', Date.today.month)
    .where.not('teams.id =?', 1)
    .group('users.id')
    .select('users.*, SUM(activities.score) AS total_score')
    .order('total_score DESC')

    @teams = Team.all

    @green_score = Activity.joins(user: :team).where('team_id =? AND DATE_PART(\'month\', activities.created_at) = ?', 3, Date.today.month).sum(:score)
    @orange_score = Activity.joins(user: :team).where('team_id = ? AND DATE_PART(\'month\', activities.created_at) = ?', 2, Date.today.month).sum(:score)
    @blue_score = Activity.joins(user: :team).where('team_id = ? AND DATE_PART(\'month\', activities.created_at) = ?', 4, Date.today.month).sum(:score)

    @green_percent =  percentage(@green_score)
    @orange_percent =  percentage(@orange_score)
    @blue_percent =  percentage(@blue_score)
  end

  private
  def percentage(score)
    if @green_score + @orange_score + @blue_score > 0
      (score.to_f / (@green_score + @orange_score + @blue_score)) * 100
    else
      0
    end
  end
end