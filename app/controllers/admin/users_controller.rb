class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :restore, :toggle_admin, :assign_team]

  def index
    @users = User.includes(:team).order(:username)
    @users = @users.where('username ILIKE ?', "%#{params[:search]}%") if params[:search].present?
    
    # Filtr deleted/active
    case params[:status]
    when 'deleted'
      @users = @users.deleted
    when 'active'
      @users = @users.active
    else
      @users = @users.active # domyślnie tylko aktywni
    end
    
    @users = @users.page(params[:page]).per(20) if defined?(Kaminari)
    
    setup_table_config
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: 'Użytkownik został zaktualizowany.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    username = @user.username
    @user.soft_delete!
    redirect_to admin_users_path, notice: "Użytkownik #{username} został dezaktywowany."
  end

  def restore
    username = @user.username
    @user.restore!
    redirect_to admin_users_path, notice: "Użytkownik #{username} został przywrócony."
  end

  def toggle_admin
    status = @user.admin? ? 'odebrany' : 'nadany'
    @user.update(admin: !@user.admin?)
    redirect_to admin_user_path(@user), notice: "Status administratora został #{status}."
  end

  def assign_team
    @user.update(team_id: params[:team_id])
    redirect_to admin_user_path(@user), notice: 'Drużyna została przypisana.'
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # Nie wymagamy potwierdzenia hasła dla admina
    @user.password_confirmation = @user.password
    
    if @user.save
      redirect_to admin_user_path(@user), notice: 'Użytkownik został utworzony.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.unscoped.find(params[:id]) # unscoped żeby znaleźć też usuniętych
  end

  def user_params
    params.require(:user).permit(:username, :email, :team_id, :admin, :password)
  end

  def setup_table_config
    @table_filters = [
      { name: :search, label: 'Szukaj użytkownika', type: :text, placeholder: 'Nazwa użytkownika lub email...' },
      { name: :status, label: 'Status', type: :select, options: [['Aktywni', 'active'], ['Usunięci', 'deleted'], ['Wszyscy', 'all']], placeholder: 'Wybierz status...' }
    ]

    @table_columns = [
      { label: 'ID', value: ->(user) { user.id }, format: :number },
      { label: 'Użytkownik', value: ->(user) { user.username }, format: :link, url: ->(user) { admin_user_path(user) } },
      { label: 'Email', value: ->(user) { user.email } },
      { label: 'Drużyna', value: ->(user) { user.team&.name || 'Brak' }, format: :badge, badge_class: method(:team_badge_class) },
      { label: 'Admin', value: ->(user) { user.admin? }, format: :boolean },
      { label: 'Status', value: ->(user) { user.deleted? ? 'Usunięty' : 'Aktywny' }, format: :badge, badge_class: method(:status_badge_class) },
      { label: 'Aktywności', value: ->(user) { user.activities.count }, format: :number },
      { label: 'Data', value: ->(user) { user.deleted? ? user.deleted_at : user.created_at }, format: :date }
    ]

    @table_actions = [
      { icon: 'bi bi-eye', title: 'Pokaż', url: ->(user) { admin_user_path(user) }, class: 'btn-outline-primary' },
      { icon: 'bi bi-pencil', title: 'Edytuj', url: ->(user) { edit_admin_user_path(user) }, class: 'btn-outline-warning', condition: ->(user) { !user.deleted? } },
      { icon: 'bi bi-shield-check', title: 'Przełącz admin', url: ->(user) { toggle_admin_admin_user_path(user) }, method: :patch, class: 'btn-outline-info', confirm: 'Czy na pewno chcesz zmienić uprawnienia?', action_type: 'warning', condition: ->(user) { !user.deleted? } },
      { icon: 'bi bi-arrow-clockwise', title: 'Przywróć', url: ->(user) { restore_admin_user_path(user) }, method: :patch, class: 'btn-outline-success', confirm: 'Czy na pewno chcesz przywrócić tego użytkownika?', action_type: 'info', condition: ->(user) { user.deleted? } },
      { icon: 'bi bi-trash', title: 'Usuń', url: ->(user) { admin_user_path(user) }, method: :delete, class: 'btn-outline-danger', confirm: 'Czy na pewno chcesz dezaktywować tego użytkownika?', action_type: 'danger', condition: ->(user) { !user.deleted? && user != current_user } }
    ]
  end

  def team_badge_class(user)
    case user.team&.name
    when 'Zieloni' then 'bg-success'
    when 'Pomarańczowi' then 'bg-warning text-dark'
    when 'Niebiescy' then 'bg-primary'
    else 'bg-secondary'
    end
  end

  def status_badge_class(user)
    user.deleted? ? 'bg-danger' : 'bg-success'
  end
end
