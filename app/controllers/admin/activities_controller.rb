class Admin::ActivitiesController < Admin::ApplicationController
  before_action :set_activity, only: [:show, :destroy, :hide, :unhide]

  def index
    @activities = Activity.includes(:user, :competition, :comments, :likes)
                         .order(created_at: :desc)

    # Paginacja (jeśli masz gem kaminari)
    @activities = @activities.page(params[:page]).per(20) if defined?(Kaminari)

    # Filtry
    @activities = @activities.joins(:user).where('users.username ILIKE ?', "%#{params[:user]}%") if params[:user].present?
    @activities = @activities.where(competition_id: params[:competition_id]) if params[:competition_id].present?
    @activities = @activities.where('distance >= ?', params[:min_distance]) if params[:min_distance].present?

    @competitions = Competition.order(:name)
    
    # Konfiguracja tabeli
    setup_table_config
  end

  def show
    @comments = @activity.comments.includes(:user).order(created_at: :desc)
  end

  def destroy
    user_name = @activity.user.username
    distance = @activity.distance
    @activity.destroy
    redirect_to admin_activities_path, notice: "Aktywność użytkownika #{user_name} (#{distance} km) została usunięta."
  end

  def hide
    redirect_to admin_activity_path(@activity), notice: 'Aktywność została ukryta.'
  end

  def unhide
    redirect_to admin_activity_path(@activity), notice: 'Aktywność została przywrócona.'
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def setup_table_config
    @table_filters = [
      { name: :user, label: 'Użytkownik', type: :text, placeholder: 'Nazwa użytkownika...' },
      { name: :competition_id, label: 'Konkurs', type: :select, options: @competitions.pluck(:name, :id), placeholder: 'Wybierz konkurs...' },
      { name: :min_distance, label: 'Min. dystans (km)', type: :number, placeholder: '0' }
    ]

    @table_columns = [
      { label: 'ID', value: ->(activity) { activity.id }, format: :number },
      { label: 'Użytkownik', value: ->(activity) { activity.user.username }, format: :link, url: ->(activity) { admin_user_path(activity.user) } },
      { label: 'Dystans', value: ->(activity) { "#{activity.distance} km" } },
      { label: 'Czas', value: ->(activity) { "#{activity.hours}:#{activity.minutes.to_s.rjust(2, '0')}:#{activity.seconds.to_s.rjust(2, '0')}" } },
      { label: 'Konkurs', value: ->(activity) { activity.competition&.name || 'Brak' }, format: :badge, badge_class: ->(activity) { activity.competition ? 'bg-primary' : 'bg-secondary' } },
      { label: 'Punkty', value: ->(activity) { activity.score }, format: :number },
      { label: 'Komentarze', value: ->(activity) { activity.comments.count }, format: :number },
      { label: 'Polubienia', value: ->(activity) { activity.likes.count }, format: :number },
      { label: 'Data', value: ->(activity) { activity.created_at }, format: :date }
    ]

    @table_actions = [
      { icon: 'bi bi-eye', title: 'Pokaż', url: ->(activity) { admin_activity_path(activity) }, class: 'btn-outline-primary' },
      { icon: 'bi bi-person', title: 'Zobacz użytkownika', url: ->(activity) { admin_user_path(activity.user) }, class: 'btn-outline-info' },
      { icon: 'bi bi-trash', title: 'Usuń', url: ->(activity) { admin_activity_path(activity) }, method: :delete, class: 'btn-outline-danger', confirm: 'Czy na pewno chcesz usunąć tę aktywność?' }
    ]
  end
end
