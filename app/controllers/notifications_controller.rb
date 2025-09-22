class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.recent.limit(20)
  end

  def mark_read
    notification = current_user.notifications.find(params[:id])
    notification.mark_as_read!
    
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { render json: { status: 'success' } }
    end
  end

  def mark_all_read
    current_user.notifications.unread.update_all(read: true, read_at: Time.current)
    
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { render json: { status: 'success' } }
    end
  end

  def unread_count
    render json: { count: current_user.unread_notifications_count }
  end

  def create
    # For testing - create a test notification
    if Rails.env.development?
      Notification.create_for_user(
        current_user, 
        "Test powiadomienia", 
        "To jest test systemu powiadomień", 
        "info"
      )
    end
    
    redirect_back(fallback_location: root_path)
  end
end
