class Admin::CompetitionsController < Admin::ApplicationController
  before_action :set_competition, only: [:show, :edit, :update, :destroy, :activate, :deactivate, :statistics]

  def index
    @competitions = Competition.order(created_at: :desc)
    @competitions = @competitions.page(params[:page]).per(10) if defined?(Kaminari)
    
    @active_competitions = Competition.active
    @upcoming_competitions = Competition.upcoming
    @finished_competitions = Competition.finished
    
    setup_table_config
  end

  def show
    @participants = User.joins(:activities)
                       .where(activities: { competition: @competition })
                       .distinct
                       .includes(:team)
    @team_scores = calculate_team_scores
  end

  def new
    @competition = Competition.new
  end

  def create
    @competition = Competition.new(competition_params)
    
    if @competition.save
      redirect_to admin_competition_path(@competition), notice: 'Konkurs został utworzony.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @competition.update(competition_params)
      redirect_to admin_competition_path(@competition), notice: 'Konkurs został zaktualizowany.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    name = @competition.name
    @competition.destroy
    redirect_to admin_competitions_path, notice: "Konkurs '#{name}' został usunięty."
  end

  def activate
    if params[:is_main] == 'true'
      Competition.where(is_main: true).update_all(is_main: false)
      @competition.update(is_main: true, is_active: true)
      redirect_to admin_competition_path(@competition), notice: 'Konkurs został aktywowany jako główny.'
    else
      @competition.update(is_active: true)
      redirect_to admin_competition_path(@competition), notice: 'Konkurs został aktywowany.'
    end
  end

  def deactivate
    begin
      @competition.update!(is_active: false, is_main: false)
      redirect_to admin_competition_path(@competition), notice: 'Konkurs został dezaktywowany.'
    rescue ActiveRecord::RecordInvalid => e
      redirect_to admin_competition_path(@competition), alert: "Błąd: #{e.message}"
    end
  end

  def statistics
    @stats = {
      participants_count: @competition.participants_count,
      total_activities: @competition.total_activities_count,
      average_score: @competition.average_score,
      total_distance: @competition.activities.sum(:distance),
      top_performers: User.joins(:activities)
                         .where(activities: { competition: @competition })
                         .group(:id, :username)
                         .select('users.*, SUM(activities.score) AS total_score')
                         .order('total_score DESC')
                         .limit(10)
    }
  end

  private

  def set_competition
    @competition = Competition.find(params[:id])
  end

  def competition_params
    params.require(:competition).permit(:name, :description, :competition_type, :start_date, :end_date, :is_main, :is_active, :points_multiplier, :rules)
  end

  def calculate_team_scores
    scores = {}
    Team.where.not(name: "niesklasyfikowany").find_each do |team|
      team_score = Activity.joins(:user)
                          .where(users: { team: team })
                          .where(competition: @competition)
                          .sum(:score)
      scores[team.name.downcase.to_sym] = team_score
    end
    scores
  end

  def setup_table_config
    @table_columns = [
      { label: 'Nazwa', value: ->(comp) { comp.name }, format: :link, url: ->(comp) { admin_competition_path(comp) } },
      { label: 'Typ', value: ->(comp) { comp.competition_type.humanize }, format: :badge, badge_class: method(:competition_type_badge_class) },
      { label: 'Status', value: ->(comp) { competition_status(comp) }, format: :badge, badge_class: method(:competition_status_badge_class) },
      { label: 'Główny', value: ->(comp) { comp.is_main? }, format: :boolean },
      { label: 'Okres', value: ->(comp) { "#{comp.start_date.strftime('%d.%m')} - #{comp.end_date.strftime('%d.%m.%Y')}" } },
      { label: 'Uczestników', value: ->(comp) { comp.participants_count }, format: :number },
      { label: 'Aktywności', value: ->(comp) { comp.total_activities_count }, format: :number }
    ]

    @table_actions = [
      { icon: 'bi bi-eye', title: 'Pokaż', url: ->(comp) { admin_competition_path(comp) }, class: 'btn-outline-primary' },
      { icon: 'bi bi-graph-up', title: 'Statystyki', url: ->(comp) { statistics_admin_competition_path(comp) }, class: 'btn-outline-info' },
      { icon: 'bi bi-pencil', title: 'Edytuj', url: ->(comp) { edit_admin_competition_path(comp) }, class: 'btn-outline-warning' },
      { icon: 'bi bi-play-circle', title: 'Aktywuj', url: ->(comp) { activate_admin_competition_path(comp) }, method: :patch, class: 'btn-outline-success', condition: ->(comp) { !comp.active? } },
      { icon: 'bi bi-pause-circle', title: 'Dezaktywuj', url: ->(comp) { deactivate_admin_competition_path(comp) }, method: :patch, class: 'btn-outline-secondary', condition: ->(comp) { comp.active? } },
      { icon: 'bi bi-trash', title: 'Usuń', url: ->(comp) { admin_competition_path(comp) }, method: :delete, class: 'btn-outline-danger', confirm: 'Czy na pewno chcesz usunąć ten konkurs?', condition: ->(comp) { !comp.active? } }
    ]
  end

  def competition_type_badge_class(comp)
    case comp.competition_type
    when 'points' then 'bg-primary'
    when 'distance' then 'bg-success'
    when 'pace' then 'bg-info'
    when 'regularity' then 'bg-warning text-dark'
    else 'bg-secondary'
    end
  end

  def competition_status(comp)
    if comp.active?
      'Aktywny'
    elsif comp.upcoming?
      'Nadchodzący'
    else
      'Zakończony'
    end
  end

  def competition_status_badge_class(comp)
    if comp.active?
      'bg-success'
    elsif comp.upcoming?
      'bg-warning text-dark'
    else
      'bg-secondary'
    end
  end
end
