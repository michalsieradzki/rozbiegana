class CompetitionsController < ApplicationController
  def index
    @current_competition = Competition.current_main_competition
    @all_active_competitions = Competition.active.order(:created_at)
    
    if @current_competition
      # Używamy nowego systemu
      @users = User.joins(:activities, :team)
                   .where(activities: { competition: @current_competition })
                   .where.not('teams.id = ?', 1) # niesklasyfikowani
                   .group('users.id')
                   .select('users.*, SUM(activities.score) AS total_score')
                   .order('total_score DESC')
      
      # Punkty zespołów
      @team_scores = calculate_team_scores(@current_competition)
      @green_score = @team_scores[:green] || 0
      @orange_score = @team_scores[:orange] || 0
      @blue_score = @team_scores[:blue] || 0

      # Dodaj te statystyki:
      @competition_stats = {
        participants: @current_competition.participants_count,
        total_activities: @current_competition.total_activities_count,
        average_score: @current_competition.average_score,
        days_remaining: @current_competition.days_remaining
      }
    else
      # Fallback do starego systemu (gdyby nie było aktywnego konkursu)
      @users = User.joins(:activities, :team)
                   .where('DATE_PART(\'month\', activities.created_at) = ?', Date.today.month)
                   .where.not('teams.id = ?', 1)
                   .group('users.id')
                   .select('users.*, SUM(activities.score) AS total_score')
                   .order('total_score DESC')
      
      @green_score = Activity.joins(user: :team).where('team_id = ? AND DATE_PART(\'month\', activities.created_at) = ?', 2, Date.today.month).sum(:score)
      @orange_score = Activity.joins(user: :team).where('team_id = ? AND DATE_PART(\'month\', activities.created_at) = ?', 3, Date.today.month).sum(:score)
      @blue_score = Activity.joins(user: :team).where('team_id = ? AND DATE_PART(\'month\', activities.created_at) = ?', 4, Date.today.month).sum(:score)
    end
    
    @green_percent = percentage(@green_score)
    @orange_percent = percentage(@orange_score)
    @blue_percent = percentage(@blue_score)
  end

  private

  def calculate_team_scores(competition)
    scores = {}
    
    Team.where.not(name: "niesklasyfikowany").find_each do |team|
      team_score = Activity.joins(:user)
                          .where(users: { team: team })
                          .where(competition: competition)
                          .sum(:score)
      
      case team.name
      when "Zieloni"
        scores[:green] = team_score
      when "Pomarańczowi"
        scores[:orange] = team_score
      when "Niebiescy"
        scores[:blue] = team_score
      end
    end
    
    scores
  end

  def percentage(score)
    total = @green_score + @orange_score + @blue_score
    total > 0 ? (score.to_f / total) * 100 : 0
  end
end
