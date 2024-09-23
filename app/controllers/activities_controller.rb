class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy ]

  # GET /activities or /activities.json
  def index
    @activities = Activity.all.order(created_at: :desc).limit(20)
    @comment = Comment.new
    @messages = Message.all.order(created_at: :desc).limit(20)
    @message = Message.new
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
    @activities = Activity.where(user: current_user).order(created_at: :desc).limit(20)
    @top_pace = @activities.sort_by(&:pace).first

  end
  def top
    @month_names = ["Styczeń", "Luty", "Marzec", "Kwiecień", "Maj", "Czerwiec", "Lipiec", "Sierpień", "Wrzesień", "Październik", "Listopad", "Grudzień"]
    if params[:month]
      @month = @month_names.find_index(params[:month]).to_i + 1
    else
      @month = Time.now.month
    end
    @current_month_name = @month_names[@month-1]

    start_date = Time.now.change(month: @month).beginning_of_month
    end_date = Time.now.change(month: @month).end_of_month
    @activities = Activity.where(created_at: start_date..end_date)
    @top_distance = @activities.order(distance: :desc).take(10)
    @top_pace = @activities.sort_by(&:pace).take(10)
    @top_user_distance = User.joins(:activities)
                              .where(activities: { created_at: start_date..end_date })
                              .group(:username)
                              .sum(:distance)
                              .sort_by { |_, distance| -distance }

    @users_total_score = User.joins(:activities)
                              .where("activities.created_at BETWEEN ? AND ?", start_date.beginning_of_day, end_date.end_of_day)
                              .group(:id)
                              .select("users.*, SUM(activities.score) AS total_score")
                              .order("total_score DESC")
  end

  def set_month
    @month = params[:month]

  end
  # POST /activities or /activities.json
  def create
    @activity = Activity.new(activity_params)
    @activity.score = @activity.calculate_score
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
      @activity.score = @activity.calculate_score
      if @activity.update(activity_params)
        @activity.score = @activity.calculate_score
        if @activity.save
        format.html { redirect_to activity_url(@activity), notice: "Aktywność pomyślnie zaktualizowana." }
        format.json { render :show, status: :ok, location: @activity }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @activity.errors, status: :unprocessable_entity }
        end
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
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:hours, :minutes, :seconds, :distance, :competition, :description, :image, :score, :user_id)
    end

    def mark_notifications_as_read
      if current_user
        @activity.notifications.where(recipient: current_user).unread.mark_as_read!
      end
    end

end
