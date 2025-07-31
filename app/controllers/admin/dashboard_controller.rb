# app/controllers/admin/dashboard_controller.rb
class Admin::DashboardController < Admin::ApplicationController
  def index
    @stats = {
      users_count: User.active.count,
      deleted_users_count: User.deleted.count,
      activities_count: Activity.count,
      competitions_count: Competition.count,
      teams_count: Team.count,
      active_competitions: Competition.active.count,
      users_this_month: User.active.where(created_at: Date.current.beginning_of_month..Date.current.end_of_month).count,
      activities_this_month: Activity.where(created_at: Date.current.beginning_of_month..Date.current.end_of_month).count
    }
    
    @recent_activities = Activity.includes(:user, :competition).recent.limit(10)
    @active_competitions = Competition.active.limit(5)
    @top_users_this_month = User.joins(:activities)
                               .where(activities: { created_at: Date.current.beginning_of_month..Date.current.end_of_month })
                               .group(:id, :username)
                               .select('users.*, SUM(activities.score) AS total_score')
                               .order('total_score DESC')
                               .limit(5)
  end
end
