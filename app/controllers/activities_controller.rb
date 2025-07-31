class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy ]

  # GET /activities or /activities.json
  def index
    @activities = Activity.with_associations.recent.page(params[:page]).per(10)
    @comment = Comment.new
    @messages = Message.all.order(created_at: :desc).limit(20)
    @message = Message.new

    respond_to do |format|
      format.html
      format.js { render partial: 'activities_page', locals: { activities: @activities } }
    end
  end

  # GET /activities/1 or /activities/1.json
  def show
    @comments = @activity.comments
    @comment = Comment.new

    mark_notifications_as_read
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  def myactive
    @activities = Activity.with_associations
                         .where(user: current_user)
                         .recent
                         .limit(20)
    @top_pace = @activities.min_by(&:pace)
  end

  def top
    @month_names = ["Styczeń", "Luty", "Marzec", "Kwiecień", "Maj", "Czerwiec", "Lipiec", "Sierpień", "Wrzesień", "Październik", "Listopad", "Grudzień"]
    @month = params[:month] ? @month_names.find_index(params[:month]) + 1 : Time.now.month
    @current_month_name = @month_names[@month-1]

    # Używamy scope'ów
    activities_scope = Activity.with_associations.for_month(@month)
    
    @top_distance = activities_scope.top_distance(10)
    @top_pace = activities_scope.top_pace(10)
    
    start_date = Time.now.change(month: @month).beginning_of_month
    end_date = Time.now.change(month: @month).end_of_month
    
    @top_user_distance = User.joins(:activities)
                             .where(activities: { created_at: start_date..end_date })
                             .group(:username)
                             .sum(:distance)
                             .sort_by { |_, distance| -distance }
                             .first(10)

    @users_total_score = User.joins(:activities)
                             .where("activities.created_at BETWEEN ? AND ?", start_date.beginning_of_day, end_date.end_of_day)
                             .group(:id, :username)
                             .select("users.username, SUM(activities.score) AS total_score")
                             .order("total_score DESC")
                             .limit(10)
  end

  # POST /activities or /activities.json
  def create
    @activity = Activity.new(activity_params)
    respond_to do |format|
      if @activity.save
        format.html { redirect_to root_path, notice: "Aktywność dodana pomyślnie." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to activity_url(@activity), notice: "Aktywność pomyślnie zaktualizowana." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url, notice: "Aktywność pomyślnie usunięta." }
      format.json { head :no_content }
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:hours, :minutes, :seconds, :distance, :competition_id, :description, :image, :score, :user_id)
  end

  def mark_notifications_as_read
    if current_user
      @activity.notifications.where(recipient: current_user).unread.mark_as_read!
    end
  end
end
