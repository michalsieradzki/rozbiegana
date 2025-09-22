class Admin::NotificationsController < Admin::ApplicationController
  before_action :set_notification, only: [:destroy]

  def index
    @notifications = Notification.includes(:user)
                                .order(created_at: :desc)
                                .page(params[:page])
    
    # Filter by read status if specified
    if params[:filter] == 'unread'
      @notifications = @notifications.unread
    elsif params[:filter] == 'admin_sent'
      @notifications = @notifications.where("data->>'sent_by' = ?", 'admin')
    end

    @notification = Notification.new
    @users = User.order(:username).map { |u| [u.id, "#{u.username} (#{u.email})"] }
  end

  def create
    if params[:send_to_all] == '1'
      # Send to all users
      users = User.all
      message = "Wysłano do wszystkich użytkowników (#{users.count})"
    else
      # Send to selected users
      user_ids = params[:notification][:user_ids].reject(&:blank?)
      users = User.where(id: user_ids)
      message = "Wysłano do #{users.count} użytkowników"
    end

    if users.any?
      users.each do |user|
        Notification.create_for_user(
          user,
          params[:notification][:title],
          params[:notification][:body],
          params[:notification][:notification_type],
          { 'sent_by' => 'admin', 'admin_id' => current_user.id }
        )
      end
      
      redirect_to admin_notifications_path, notice: message
    else
      redirect_to admin_notifications_path, alert: "Nie wybrano żadnych użytkowników"
    end
  end

  def destroy
    @notification.destroy
    redirect_to admin_notifications_path, notice: "Powiadomienie zostało usunięte"
  end

  def bulk_destroy
    notification_ids = params[:notification_ids]
    if notification_ids.present?
      Notification.where(id: notification_ids).destroy_all
      redirect_to admin_notifications_path, notice: "Usunięto #{notification_ids.count} powiadomień"
    else
      redirect_to admin_notifications_path, alert: "Nie wybrano żadnych powiadomień"
    end
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end

  def notification_params
    params.require(:notification).permit(:title, :body, :notification_type, user_ids: [])
  end
end